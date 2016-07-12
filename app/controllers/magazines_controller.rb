class MagazinesController < BaseController
  def index
    @magazines = Magazine.all

    @votes = if params[:comic_chapter_id].present?
      Vote.where(comic_chapter_id: params[:comic_chapter_id])
    else
      Vote.all[-3..-1]
    end
  end
end
