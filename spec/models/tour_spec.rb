require 'rails_helper'

RSpec.describe Tour, type: :model do
	it "is valid with a vehicle_id, passenger_id, from, to" do
  	expect(build(:tour)).to be_valid
  end

  it "is invalid without a vehicle_id" do
  	tour = build(:tour, vehicle_id: nil)
  	tour.valid?
  	expect(tour.errors[:vehicle_id]).to include("can't be blank")
  end

  it "is invalid without a passenger_id" do
  	tour = build(:tour, passenger_id: nil)
  	tour.valid?
  	expect(tour.errors[:passenger_id]).to include("can't be blank")
  end
end
