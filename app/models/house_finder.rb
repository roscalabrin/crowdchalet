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
end