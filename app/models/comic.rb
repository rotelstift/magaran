class Comic < ActiveRecord::Base
	has_many :comic_chapters
	has_many :carriages
	has_many :magazines, through: :carriages

	accepts_nested_attributes_for :carriages
end
