class EventsController < ApplicationController
  before_action :authenticate_user!


  def index
    @events = Event.all.order(created_at: :DESC)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:notice] = "Event successfully updated"
      redirect_to event_path
    else
      flash[:alert] = "We are unable to process your request"
      render :new
    end
  end


  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:notice] = "Event created successfully"
      redirect_to @event
    else
      flash[:alert] = "Something went wrong, please check your inputs."
      render :new
    end

def destroy
end

  end


private
def event_params
  params.require(:event).permit(:name, :date, :description, :location)
end
end
