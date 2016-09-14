class CraigslistService
  attr_reader :listings, 
              :params
  
  def initialize(params)
    @params = params
    @listings = []
  end
  
  def search_ski_houses
    location = params[:location]
    max_price = params[:max_price]
    page = HTTParty.get "https://rockies.craigslist.org/search/apa?query=#{location}&max_price=#{max_price}"
    parse_page = Nokogiri::HTML(page)
     parse_page.css('.content').css('.row').css('.hdrlnk').map do |a|
       post_name = a.text
       post_link = a.attributes["href"].value
       listings.push("#{post_name}, https://rockies.craigslist.org#{post_link}")
     end
     listings
  end
end