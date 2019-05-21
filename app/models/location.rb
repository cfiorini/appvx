class Location < ApplicationRecord
  belongs_to :country
  has_many :pop_maps
end
