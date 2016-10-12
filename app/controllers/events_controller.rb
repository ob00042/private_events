class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		@event = current_user.created_events.build(event_params)
		if @event.save
			flash[:success] = "Event created"
			redirect_to user_path current_user
		else
			flash[:danger] = 'Event not created'
			redirect_to user_path current_user
		end
	end

	def show
		@event = Event.find_by(id: params[:id])
		@attendees = @event.attendees.all
	end

	def index
		@events = Event.all
	end

	def event_params
		params.require(:event).permit(:description, :date)
	end

end
