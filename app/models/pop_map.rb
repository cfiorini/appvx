class PopMap < ApplicationRecord

  belongs_to :location
  has_one :country, through: :location

  validates :price, numericality: true

  def full_location
    "#{self.location.name} (#{self.country.name})"
  end

  def self.to_select
    joins(:country, :location).
        includes(:country, :location).
        order(:created_at).
        all.map{|r| ["#{r.name} - #{r.full_location} - #{ActionController::Base.helpers.number_to_currency(r.price)}", r.id] }
  end
end
