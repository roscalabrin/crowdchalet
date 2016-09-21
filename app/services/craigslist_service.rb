class CraigslistService
  
  def search_ski_houses(params)
    page = HTTParty.get "https://rockies.craigslist.org/search/apa?query=#{params[:location]}&max_price=#{params[:max_price]}"
    parse_page = Nokogiri::HTML(page)
    listings   = find_listings
    prices     = find_prices
    return listings, prices
  end
  
  def find_listings
    parse_page.css('.content').css('.row').css('.hdrlnk').to_a
  end
  
  def find_prices
    parse_page.css('.content').css('.row').css('.price').to_a
  end
end
