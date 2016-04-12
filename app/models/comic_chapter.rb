class ComicChapter < ActiveRecord::Base
	belongs_to :comic
	belongs_to :magazine_volume

	delegate :title, :author, to: :comic

#	def comic_title
#		comic.title
#	end

end
