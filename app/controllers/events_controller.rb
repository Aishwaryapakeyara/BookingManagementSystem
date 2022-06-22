class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def new
    @event = Event.new

    if request.xhr?
      respond_to do |format|
        format.json {
          render json: { locations: Location.where("city_id = ?", params[:city_id]) }
        }
      end
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :city_id, :category_id, :location_id)
  end
end
