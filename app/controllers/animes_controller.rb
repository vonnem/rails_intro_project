class AnimesController < ApplicationController
  def index
    @animes = Anime.includes(:studio).all.order("score DESC")
  end

  def show
    @anime = Anime.find(params[:id])
  end
end
