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

  end

  private
  def vote_params
    params.require(:vote).permit(:comic_chapter_id, :loved, :impression)
  end
end
