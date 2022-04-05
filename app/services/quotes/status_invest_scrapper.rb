module Quotes
  class StatusInvestScrapper < ScrapperBase
    URL = 'https://statusinvest.com.br/acoes'
    ASSETS_SYMBOLS_URL = {
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

    def self.quote_url(asset_symbol)
      "#{URL}/#{ASSETS_SYMBOLS_URL.with_indifferent_access[asset_symbol]}"
    end

    def self.supported_assets_symbols
      ASSETS_SYMBOLS_URL.map { |k, _| k }
    end
  end
end
