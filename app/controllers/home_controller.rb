class HomeController < ApplicationController
  def index
    page = HTTParty.get 'https://rockies.craigslist.org/search/vac?min_price=800&max_price=2000'
    #can add bedrooms number and cat/dog friendly
    parse_page = Nokogiri::HTML(page)
    @listings_array = []
    parse_page.css('.content').css('.row').css('.hdrlnk').map do |a|
      post_name = a.text
      post_link = a.attributes["href"].value
      @listings_array.push("#{post_name}, #{post_link}")
    end
    return @listings_array
  end
end
