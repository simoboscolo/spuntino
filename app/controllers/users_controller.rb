class UsersController < ApplicationController

	before_filter :authenticate_user!
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def update 
		@user = User.find(params[:id])
		redirect_to @user
	end

end
