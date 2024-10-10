class EventAttendeesController < ApplicationController
  def new
    @event_attendee = EventAttendee.new
  end

  def create
    Rails.logger.info "Current user id: #{current_user.id}"
    # Rails.logger.info "Params: #{params.inspect}"
    @event = Event.find(params[:event_id])
    @event_attendee = @event.event_attendees.build(attendee: current_user)
    if @event_attendee.save
      flash[:success] = "Object successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end
end
