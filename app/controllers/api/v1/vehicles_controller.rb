class Api::V1::VehiclesController < Api::V1::BaseApiController
  before_action :find_vehicle, only: [:show, :update, :destroy]

	 # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all
    if @vehicles.present?
    	render json: { vehicles: @vehicles, status: :ok }
    else
      render json: { :status => "204", :message => "There is not vehicles" }, status: :no_content
    end
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    render json: @vehicle
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      render json: { status: 'Vehicle created successfully', vehicle: @vehicle }, status: :created
    else
      render json: { errors: @vehicle.errors.full_messages }, status: :bad_request
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    if @vehicle.update(vehicle_params)
      render json: { status: 'Vehicle was successfully updated', vehicle: @vehicle }, status: :ok
    else
      render json: { errors: @vehicle.errors.full_messages }, status: :bad_request
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    render json: { status: 'Vehicle was successfully destroyed' }, status: :ok
  end

  private
	  def find_vehicle
	    @vehicle = Vehicle.find(params[:id])
	    render nothing: true, status: :not_found unless @vehicle.present?
	  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:license_plate, :color, :year)
    end
end