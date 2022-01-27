require 'pry'
require 'dotenv'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_ville
  ville_name_array = []
  page_url_region = "https://www.annuaire-des-mairies.com/val-d-oise.html"

  region_page = Nokogiri::HTML(URI.open(page_url_region))

  return ville_name_array = region_page.xpath("//a[contains(@class, 'lientxt')]/text()").map {|x| x.to_s.downcase.gsub(" ", "-") }
end


def get_email (ville_names) #email de chaque ville

  ville_email_array = []
  

  # Boucle sur chaque ville dans le tableau pour avoir leur mail
  for i in 0...ville_names.length

    page_url_ville = "https://www.annuaire-des-mairies.com/95/#{ville_names[i]}.html"
    ville_page = Nokogiri::HTML(URI.open(page_url_ville))


      # met chaque mail dans un tableau
      ville_email_array << ville_page.xpath("//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()").to_s
  end
  
  return ville_email_array
end


puts email_ville_result = Hash[get_ville.zip(get_email(get_ville))]
