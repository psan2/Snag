class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :show, :update, :destroy]
    
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
        if @user.valid?
            @user.save
            flash[:notice] = "User has been created"
            redirect_to users_path 
        else 
            flash[:errors] = @user.errors.full_messages
            flash[:notice] = "User was not saved"
            render :new 
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
            redirect_to edit_brand_path
        end
    end 

    def destroy 
        @user.destroy 
        flash[:notice] = "User has been deleted"
        redirect_to users_path
    end 

    private

    def user_params 
        params.require(:user).permit(:name, :mod_id)
    end 

    def find_user
        @user = User.find(params[:id])
    end



end
