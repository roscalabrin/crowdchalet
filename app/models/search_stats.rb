class SearchStats
  
  def self.average_price(houses)
    selected_prices = houses.map do |house|
      house.children.text.split("$").second.to_i
    end
    selected_prices.reduce(:+)/selected_prices.count
  end
end