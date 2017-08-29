class Api::V1::CarsController < ApiController
  before_action :check_track, :find_car, :find_track, :load_max_speed_service

  respond_to :json

  def show
    max_speed_on_track = @max_speed_service.get
    render json: { car: Api::V1::CarPresenter.new(car: @car, max_speed_on_track: max_speed_on_track).presentable }
  end

  private

  def find_car
    @car = Car.find_by!(slug: params[:car_slug])
  end

  def find_track
    @track ||= Track.find_by(name: params[:track])
  end

  def check_track
    render json: 'No track selected' and return unless params[:track].present?
    render json: 'Track not found' unless find_track
  end

  def entry
    Api::V1::MaxSpeedStrategyEntry.new(car: @car, track: @track)
  end

  def load_max_speed_service
    @max_speed_service = Api::V1::MaxSpeedOnTrackService.new(entry: entry, max_speed_strategy: Api::V1::SimpleMaxSpeedStrategy.new)
  end
end
