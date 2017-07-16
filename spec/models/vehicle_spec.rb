require 'rails_helper'

RSpec.describe Vehicle, type: :model do
	it "is valid with a vehicle license_plate, color, year, category_id" do
  	expect(build(:vehicle)).to be_valid
  end

  it "is invalid without a license_plate" do
  	vehicle = build(:vehicle, license_plate: nil)
  	vehicle.valid?
  	expect(vehicle.errors[:license_plate]).to include("can't be blank")
  end

end
