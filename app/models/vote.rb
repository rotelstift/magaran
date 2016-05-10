class Vote < ActiveRecord::Base
  belongs_to :comic_chapter
  belongs_to :user

  delegate :title, :author, :subtitle, to: :comic_chapter
end
