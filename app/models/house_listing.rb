class HouseListing
  attr_reader :name, :link, :saved
  
  def initialize(hash)
    @name  = hash[:name]
    @link  = hash[:link]
    @saved = false
  end
end