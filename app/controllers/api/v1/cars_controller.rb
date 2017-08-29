class Api::V1::CarsController < ApiController
  before_filter :find_car, :find_track

  def show
    max_speed_on_track = max_speed_service.get
    render json: { car: CarPresenter.new(car: @car, max_speed_on_track: max_speed_on_track).presentable }
  end

  def find_car
    @car = Car.find_by(slug: params[:car_slug])
  end

  def find_track
    @track = Track.find_by(name: params[:track])
  end

  def entry
    Api::V1::MaxSpeedStrategyEntry.new(car: @car, track: @track)
  end

  def max_speed_service
    Api::V1::MaxSpeedOnTrackService.new(entry: entry, max_speed_strategy: SimpleMaxSpeedStrategy.new)
  end

end
