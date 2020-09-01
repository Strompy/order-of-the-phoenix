class SearchController < ApplicationController
  def index
    @members = PotterService.search(params[:house])
    @house = params[:house]
  end
end
