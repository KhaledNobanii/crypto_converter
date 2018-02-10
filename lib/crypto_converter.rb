require 'crypto_converter/converter'

class CryptoConverter
  def self.init(current_currency, targeted_currency, currencies_path = "https://www.getsaascoin.com/api/v1/currencies")
    @converter = Converter.new(current_currency, targeted_currency, currencies_path)
  end
end
