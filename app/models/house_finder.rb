class HouseFinder
  attr_reader :params

  def initialize(params)
    @params = params
  end
  
  def self.custom_search(params)
    new(params).return_houses
  end
  
  def return_houses
    houses = service.search_ski_houses(params)
    houses.map do |house|
      house_path = house.attributes["href"].value
      HouseListing.new(
          name: house.children.text,
          link: "https://rockies.craigslist.org#{house_path}"
        )
      end  
  end
  
  def service
    CraigslistService.new
  end
end