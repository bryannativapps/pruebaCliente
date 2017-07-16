require 'spec_helper'

RSpec.describe Api::V1::VehiclesController, type: :controller do

  describe "POST #create" do
    context "with valid params" do
      it "create a new vehicle and set category_id 1" do
        post :create, { vehicle: attributes_for(:vehicle) }

        expect(json_response[:vehicle]).to include(:license_plate)
        expect(json_response[:vehicle]).to include(:color)
        expect(json_response[:vehicle]).to include(:year)
        expect(json_response[:vehicle]).to include(:category_id)
        expect(json_response[:vehicle][:category_id]).to eq(1)
        expect(json_response[:status]).to eq("Vehicle created successfully")
      end
      it "create a new vehicle and set category_id 2" do
        post :create, { vehicle: attributes_for(:vehicle, license_plate: "DFG123") }

        expect(json_response[:vehicle]).to include(:license_plate)
        expect(json_response[:vehicle]).to include(:color)
        expect(json_response[:vehicle]).to include(:year)
        expect(json_response[:vehicle]).to include(:category_id)
        expect(json_response[:vehicle][:category_id]).to eq(2)
        expect(json_response[:status]).to eq("Vehicle created successfully")
      end
    end
    context "with invalid params" do
      before(:each) do
        @vehicle = create(:vehicle)
      end
      it "cannot create a new user with the same license plate" do
        post :create, { vehicle: attributes_for(:vehicle) }

        expect(json_response[:errors][0]).to eq("License plate has already been taken")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      before(:each) do
        @vehicle = create(:vehicle)
      end
      it "update an vehicle license plate" do
        put :update, id: @vehicle, vehicle: attributes_for(:vehicle, license_plate: "abc123")

        expect(json_response[:vehicle]).to include(:license_plate)
        expect(json_response[:vehicle][:license_plate]).to eq("abc123")
        expect(json_response[:vehicle]).to include(:color)
        expect(json_response[:vehicle]).to include(:year)
        expect(json_response[:vehicle][:category_id]).to eq(1)
        expect(json_response[:vehicle]).to include(:category_id)
        expect(json_response[:status]).to eq("Vehicle was successfully updated")
      end
      it "update an vehicle license plate and expect to change the category_id" do
        put :update, id: @vehicle, vehicle: attributes_for(:vehicle, license_plate: "DFG123")

        expect(json_response[:vehicle]).to include(:license_plate)
        expect(json_response[:vehicle][:license_plate]).to eq("DFG123")
        expect(json_response[:vehicle]).to include(:color)
        expect(json_response[:vehicle]).to include(:year)
        expect(json_response[:vehicle][:category_id]).to eq(2)
        expect(json_response[:vehicle]).to include(:category_id)
        expect(json_response[:status]).to eq("Vehicle was successfully updated")
      end
    end
  end

  describe "DELETE #destroy" do
    context "with valid params" do
      before(:each) do
        @vehicle = create(:vehicle)
      end
      it "delete an vehicle" do
        delete :destroy, id: @vehicle

        expect(json_response[:status]).to eq("Vehicle was successfully destroyed")
      end
    end
  end

  describe "GET #index" do
    before(:each) do
      4.times {|i| post :create, { vehicle: attributes_for(:vehicle, license_plate: i + 1) } }
    end
    context "with valid params" do
      it "get all vehicles" do
        get :index

        expect(json_response[:vehicles].size).to eq(4)
      end
    end
  end

  describe "GET #show" do
    before(:each) do
      @vehicle = create(:vehicle)
    end
    context "with valid params" do
      it "get one specific vehicle" do
        get :show, { id: @vehicle.to_param }, format: :json

        expect(json_response).to include(:id)
        expect(json_response).to include(:color)
        expect(json_response).to include(:license_plate)
        expect(json_response).to include(:year)
        expect(json_response).to include(:category_id)
      end
    end
  end
end