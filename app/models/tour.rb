class Tour < ActiveRecord::Base
  	validates :vehicle_id, presence: true
  	validates :passenger_id, presence: true

	has_many :vehicles
	has_many :passengers

end
