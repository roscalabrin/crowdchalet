class SearchController < ApplicationController
  def index
    location = params[:location]
    max_price = params[:max_price]
    page = HTTParty.get "https://rockies.craigslist.org/search/apa?query=#{location}&max_price=#{max_price}"
    parse_page = Nokogiri::HTML(page)
     @listings_array = []
     parse_page.css('.content').css('.row').css('.hdrlnk').map do |a|
       post_name = a.text
       post_link = a.attributes["href"].value
       @listings_array.push("#{post_name}, https://rockies.craigslist.org#{post_link}")
     end
     return @listings_array
  end
end