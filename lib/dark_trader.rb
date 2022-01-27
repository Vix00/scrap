require 'pry'
require 'dotenv'
require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_currencies
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  cryptos = Array.new(0)

  page.css(".cmc-table-row").each.with_index do |line, index| # boucle pour extraire les infos
    
    symbol = line.css(".cmc-table__cell--sort-by__symbol").text
    price = line.css(".cmc-table__cell--sort-by__price").text.gsub("$", "").gsub(",", "").to_f

    cryptos[index] = { symbol => price } # Hashs dans un Array

    puts "(#{index})" + cryptos[index].to_s 

  end
	return cryptos
end

get_currencies
