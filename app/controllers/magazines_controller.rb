class MagazinesController < BaseController
  def index
    @magazines = Magazine.all

    @votes = Vote.all[-3..-1]
  end
end
