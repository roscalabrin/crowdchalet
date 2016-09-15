class HouseListing
  attr_reader :name, :link
  
  def initialize(hash)
    @name = hash[:name]
    @link = hash[:link]
  end
end