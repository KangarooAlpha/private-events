class EventsController < ApplicationController
  def index
    @events = Event.all
    @future_events = Event.future
    @past_events = Event.past
    @user = current_user
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event Created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end
