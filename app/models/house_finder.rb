class HouseFinder
  attr_reader :params

  def initialize(params)
    @params = params
  end
  
  def self.custom_search(params)
    new(params).return_houses
  end
  
  def return_houses
    find_houses = service.search_ski_houses(params)
    avg_price   = average_price(find_houses.second)
    houses      = house_info(find_houses.first)
    return  avg_price, houses
  end
  
  def house_info(houses) #create house_listings
    houses.map do |house|
      house_path = house.attributes["href"].value
      HouseListing.new(
          name: house.children.text,
          link: "https://rockies.craigslist.org#{house_path}"
        )
    end 
  end
  
  def average_price(houses) # create PORO for search stats
    selected_prices = houses.map do |house|
      house.children.text.split("$").second.to_i
    end
    selected_prices.reduce(:+)/selected_prices.count
  end
  
  def service
    CraigslistService.new
  end
end