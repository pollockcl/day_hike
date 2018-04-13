class Trail < ApplicationRecord
  has_many :trip_trails
  has_many :trips, through: :trip_trails

  def total_hikes
    trips.size
  end
end 
