class CraigslistService
  attr_reader :listings 
  
  def initialize
    @listings = []
  end
  
  def search_ski_houses(params)
    page = HTTParty.get "https://rockies.craigslist.org/search/apa?query=#{params[:location]}&max_price=#{params[:max_price]}"
    parse_page = Nokogiri::HTML(page)
     parse_page.css('.content').css('.row').css('.hdrlnk').map do |item|
      post_link = item.attributes["href"].value
      @listings.push(HouseListing.new(
        name: item.text,
        link: "https://rockies.craigslist.org#{post_link}"
      ))
     end
     @listings
  end
end
