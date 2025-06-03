class AttendancesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    current_user.attended_events << event unless current_user.attended_events.include?(event)
    redirect_to event_path(event)
  end
  def destroy
    event = Event.find(params[:event_id])
    current_user.attended_events.delete(event)
    redirect_to event_path(event)
  end
end
