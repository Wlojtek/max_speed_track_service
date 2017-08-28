class Api::V1::CarsController < ApiController
  def show
    render json: { 
      car: { car_slug: params[:car_slug] }
    }
  end
end
