
require 'nokogiri'
require 'open-uri'
require 'pry'

class StartScrap
  def perform
    coin_list_url = 'https://coinmarketcap.com/all/views/all/'
    page = Nokogiri::HTML(URI.open(coin_list_url))
    @currencies = []
    page.css('table#currencies-all tbody tr').each do |x|
      name = x.css('td.currency-name')[0]['data-sort']
      value = '$' + x.css('a.price')[0]['data-usd']
      @currencies.push(name: name, price: value)
    end
    @currencies
  end

def save
  @currencies.each do |currency|
    Crypto.create(name: currency.name, value: currency.price)
  end
end
end
