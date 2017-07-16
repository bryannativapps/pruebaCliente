class Vehicle < ActiveRecord::Base
  	validates :license_plate, presence: true, uniqueness: true

	has_many :tours
	belongs_to :category

	before_save :set_category_id

	def set_category_id
		self.category_id = self.license_plate[0,3].downcase == "abc" ? 1 : 2
	end
end
