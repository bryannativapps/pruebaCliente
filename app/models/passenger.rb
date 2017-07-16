class Passenger < ActiveRecord::Base
  	validates :name, presence: true

	has_many :tours

end
