class SearchController < ApplicationController
  def index
    @members = PotterService.search(params[:house])
  end
end
