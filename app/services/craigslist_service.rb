class CraigslistService
  include HTTParty
  base_uri 'https://rockies.craigslist.org'
  
  def search_ski_houses(params)
    page = self.class.get("/search/apa?query=#{params[:location]}&max_price=#{params[:max_price]}")
    parsed_page = Nokogiri::HTML(page)
    listings    = find_listings(parsed_page)
    prices      = find_prices(parsed_page)
    return listings, prices
  end

  def find_listings(parsed_page)
    parsed_page.css('.content').css('.row').css('.hdrlnk').to_a
  end
  
  def find_prices(parsed_page)
    parsed_page.css('.content').css('.row').css('.price').to_a
  end
end
