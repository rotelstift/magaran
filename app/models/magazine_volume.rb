class MagazineVolume < ActiveRecord::Base
	validates :magazine_id, presence: true
	belongs_to :magazine
	has_many :comic_chapters
	accepts_nested_attributes_for :comic_chapters
end
