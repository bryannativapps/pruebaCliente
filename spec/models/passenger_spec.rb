require 'rails_helper'

RSpec.describe Passenger, type: :model do
	it "is valid with a passenger name" do
  	expect(build(:passenger)).to be_valid
  end

  it "is invalid without a name" do
  	passenger = build(:passenger, name: nil)
  	passenger.valid?
  	expect(passenger.errors[:name]).to include("can't be blank")
  end
end
