class Carriage < ActiveRecord::Base
  belongs_to :magazine
  belongs_to :comic
end
