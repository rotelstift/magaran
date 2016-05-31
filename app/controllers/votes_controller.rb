class VotesController < BaseController
  def new
    @vote = Vote.new

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      redirect_to root_path
    end

    @magazines = Magazine.all
    # => [週間少年ジャンプ最新号, 週間少年マガジン最新号, 週間少年サンデー最新号, 週間少年チャンピオン最新号]

    #@comic_chapters = @magazines.first.magazine_volumes.last.comic_chapters

  end

  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @votes = Vote.all
  end

  def result
    # 選択ボックスで指定された雑誌でcomic_chaptersを検索
    @selected_magazine = MagazineVolume.where(magazine_id: params[:magazines]).last
    @selected_comic_chapters = ComicChapter.where(magazine_volume_id: @selected_magazine.id)

  end

  private
  def vote_params
    params.require(:vote).permit(:comic_chapter_id, :loved, :cool, :fan, :tears, :laugh, :impression)
  end
end
