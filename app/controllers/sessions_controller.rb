class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(name: params[:session][:name])
		if @user
			log_in @user
			redirect_to user_path @user
		else
			redirect_to user_path @user
		end
	end

	def destroy
		session.delete(:user_id)
		redirect_to login_path
	end

end
