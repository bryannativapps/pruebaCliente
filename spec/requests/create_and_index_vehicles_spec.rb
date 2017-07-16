require "spec_helper"

describe "Creates 3 vehicles and retrieve all", type: :request do
	it "Create and retrieve 3 vehicles" do
    post "/api/v1/vehicles", { vehicle: attributes_for(:vehicle)  }
    post "/api/v1/vehicles", { vehicle: attributes_for(:vehicle, license_plate: "DFG123")  }
    post "/api/v1/vehicles", { vehicle: attributes_for(:vehicle, license_plate: "abc123")  }

   
    get "/api/v1/vehicles", {}

    @json_response ||= JSON.parse(response.body, symbolize_names: true)
    expect(@json_response[:vehicles].size).to eq(3)
  end
end
