class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @studios = Studio.where("studio_name LIKE ?", wildcard_search)
  end
end
