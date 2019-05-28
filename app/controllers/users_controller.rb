class UsersController < ApplicationController
	before_action :find_user, only: [:edit, :show, :update, :destroy]
	before_action :find_mods, only: [:new, :edit, :create, :update]
	skip_before_action :require_login, only: [:new, :create]

	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
		  flash[:success] = 'Welcome!'
		  redirect_to root_path
		else
		  render 'new'
		end
	end


	def edit
	end

	def update
		@user.update(user_params)
		if @user.valid?
			redirect_to @user
			flash[:notice] = "User has been updated"
		else
			flash[:errors] = @user.errors.full_messages
			flash[:notice] = "Please try again"
			redirect_to edit_user_path
		end
	end

	def destroy
		@user.destroy
		flash[:notice] = "User has been deleted"
		redirect_to users_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :name, :mod_id)
	end

	def find_user
		@user = User.find(params[:id])
	end

	def find_mods
		@mods = Mod.all
	end


end
