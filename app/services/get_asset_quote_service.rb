# frozen_string_literal: true

class GetAssetQuoteService < ApplicationService
  require 'open-uri'

  ASSET_QUOTE_SOURCES = %i[advfn statusinvest].freeze

  def initialize(asset)
    @asset = asset
  end

  def call
    case ASSET_QUOTE_SOURCES.sample
    when :advfn
      advfn
    else
      statusinvest
    end
  end

  private

  def advfn
    base_url = 'https://br.advfn.com/bolsa-de-valores/bovespa/'
    url = "#{base_url}#{@asset.upcase}/cotacao"
    doc = Nokogiri::HTML(URI.open(url))
    asset_price = doc.css('.price-info').search('span').map(&:children)
    raise 'Asset Not Found' if asset_price.blank?

    price_to_cents(asset_price[1].text)
  end

  def statusinvest
    base_url = 'https://statusinvest.com.br/acoes/'
    url = "#{base_url}#{@asset.downcase}"
    doc = Nokogiri::HTML(URI.open(url))
    asset_price = doc.css('.d-md-inline-block').search('div').search('strong').map(&:children)
    raise 'Asset Not Found' if asset_price.blank?

    price_to_cents(asset_price[0][0].content)
  end

  def price_to_cents(asset_price)
    (asset_price.gsub(',', '.').to_r * 100).to_i
  end
end
