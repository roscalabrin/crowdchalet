class SearchController < ApplicationController
  def index
    @results = HouseFinder.custom_search(params)
  end
end