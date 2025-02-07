class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events_created.new(event_params)
    if @event.save
      flash[:success] = "Object successfully created"
      redirect_to @event
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :location)
  end
end
