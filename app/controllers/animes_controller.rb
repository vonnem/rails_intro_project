class AnimesController < ApplicationController
  def index
    @animes = Anime.includes(:studio).all.order("score DESC").paginate(page: params[:page], per_page: 50)
  end

  def show
    @anime = Anime.find(params[:id])
  end
end
