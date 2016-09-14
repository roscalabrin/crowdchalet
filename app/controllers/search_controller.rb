class SearchController < ApplicationController
  def index
    search = CraigslistService.new(params)
    @listings_array = search.search_ski_houses
  end
end