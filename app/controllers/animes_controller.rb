class AnimesController < ApplicationController
  def index
    @animes = Anime.includes(:studio).all.order("score DESC").paginate(page: params[:page], per_page: 50)
  end

  def show
    @anime = Anime.find(params[:id])
  end

  def search
    if params[:keywords].present?
      wildcard_search = "%#{params[:keywords]}%"
      @animes = Anime.includes(:studio)
                    .where("title LIKE ?", wildcard_search)
                    .order("score DESC")
    else
      @animes = Anime.includes(:studio).all.order("score DESC")
    end

    if params[:studio_id].present?
      @animes = @animes.where(studio_id: params[:studio_id])
    end
  end
end
