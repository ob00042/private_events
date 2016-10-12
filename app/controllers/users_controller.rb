class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		redirect_to 'show'
	end

	def show
		@user = User.find(params[:id])
		@events = @user.created_events
		upcoming_previous_events(@user)
		@upcoming_events
		@previously_attended
	end

	def upcoming_previous_events(user)
		@upcoming_events = []
		@previously_attended = []
		attending = user.attended_events.all
		attending.each do |a|
			if a.date < date.now
				@upcoming_events << a
			else
				@previously_attended << a
			end
		end
	end

	private

		def user_params
			params.require(:user).permit(:name)
		end
end
