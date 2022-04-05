module Quotes
  class InfoMoneyScrapper < ScrapperBase
    URL = 'https://www.infomoney.com.br/cotacoes/b3/acao'
    ASSETS_URL_CODES = {
      SOJA3: 'boa-safra-soja3',
      ENJU3: 'enjoei-enju3',
      MELK3: 'melnick-melk3/',
      SMLS3: 'smiles-smls3',
      CASH3: 'meliuz-cash3',
      AESB3: 'aes-brasil-aesb3',
      DMMO3: 'dommo-dmmo3'
    }

    def self.parse_quote(html)
      doc = Nokogiri::HTML(html)
      doc.css('.quotes-header-info').css('.value').css('p').text.gsub(/[,.]/, '').to_i
    end

    def self.quote_url(asset_code)
      "#{URL}/#{ASSETS_URL_CODES.with_indifferent_access[asset_code]}"
    end

    def self.assets_codes
      ASSETS_URL_CODES.map { |k, _| k }
    end
  end
end
