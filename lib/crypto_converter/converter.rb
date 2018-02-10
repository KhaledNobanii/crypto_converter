require 'net/http'
require 'json'

class Converter
  attr_reader :currencies_json, :current_currency, :targeted_currency

  def initialize(current_currency, targeted_currency, currencies_path)
    @current_currency = current_currency
    @targeted_currency = targeted_currency
    @currencies_path = currencies_path
    refresh
  end

  def refresh
    uri = URI.parse(@currencies_path)
    response = Net::HTTP.get(uri)
    @currencies_json = JSON.parse(response)
  end

  def convert(amount, from = nil, to = nil)
    from ||= @current_currency
    to ||= @targeted_currency
    (amount.to_f * @currencies_json[from].to_f) / @currencies_json[to].to_f
  end

  def set_targeted_currency(targeted_currency)
    @targeted_currency = targeted_currency
  end
end
