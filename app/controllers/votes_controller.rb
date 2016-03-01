class VotesController < BaseController
  def new
    @vote = Vote.new

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def create
  end
end
