class Api::V1::CarsController < ApiController
  before_filter :find_car, :find_track

  def show
    @max_speed_entry = MaxSpeedEntry.new(car: @car, track: @track)
    max_speed_on_track = MaxSpeedOnTrackService.new(entry: max_speed_entry, strategy: SimpleMaxSpeedStrategy.new).get

    render json: { car: CarPresenter.new(car: @car, max_speed_on_track: max_speed_on_track).presentable }
  end

  def find_car
    @car = Car.find(car_slug: params[:car_slug])
  end

  def find_track
    @track = Track.find(name: params[:track])
  end
end
