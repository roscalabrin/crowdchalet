class HouseFinder
  attr_reader :params

  def initialize(params)
    @params = params
  end
  
  def self.custom_search(params)
    new(params).return_houses
  end
  
  def return_houses
    service.search_ski_houses(params)
  end
  
  def service
    CraigslistService.new
  end
  
  # def format_result
  #   @raw_result.map do |listing|
  #     listing_info = listing.split(",")
  #     @locations.append(listing_info.first)
  #     @links.append(listing_info.second)
  #   end
  # end
end