module Quotes
  class StatusInvestScrapper < ScrapperBase
    URL = 'https://statusinvest.com.br/acoes'
    ASSETS_URL_CODES = {
      SOJA3: 'soja3',
      ENJU3: 'enju3',
      MELK3: 'melk3',
      SMLS3: 'smls3',
      CASH3: 'cash3',
      AESB3: 'aesb3',
      DMMO3: 'dmmo3'
    }

    def self.parse_quote(html)
      doc = Nokogiri::HTML(html)
      doc.css('.info').css('.special').css('strong').text.gsub(/[,.]/, '').to_i
    end

    def self.quote_url(asset_code)
      "#{URL}/#{ASSETS_URL_CODES.with_indifferent_access[asset_code]}"
    end

    def self.assets_codes
      ASSETS_URL_CODES.map { |k, _| k }
    end
  end
end
