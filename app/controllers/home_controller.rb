class HomeController < ApplicationController
  def index
    @animes = Anime.includes(:studio).order("score DESC").limit(50)
    @studios = Studio.all.order("studio_name DESC")
  end
end
