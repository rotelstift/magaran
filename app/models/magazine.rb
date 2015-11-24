class Magazine < ActiveRecord::Base
	has_many :magazine_volumes
	has_many :carriages
	has_many :comics, through: :carriages
end
