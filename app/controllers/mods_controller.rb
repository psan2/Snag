class ModsController < ApplicationController
    before_action :find_mod, only: [:edit, :show, :update, :destroy]
    
    def index 
        @mods = Mod.all
    end 

    def show 
    end 

    def new 
        @mod = Mod.new
    end

    def create 
        @mod = Mod.new(mod_params)
        if @mod.valid?
            @mod.save
            flash[:notice] = "Mod has been created"
            redirect_to mods_path
        else 
            flash[:errors] = @mod.errors.full_messages
            flash[:notice] = "Mod was not saved"
            render :new 
        end 
    end 

    def update
        @mod.update(mod_params)
        if @mod.valid?
            redirect_to @mod 
            flash[:notice] = "Mod has been updated"
        else 
            flash[:errors] = @mod.errors.full_messages
            flash[:notice] = "Please try again"
            redirect_to edit_brand_path
        end
    end 

    def destroy 
        @mod.destroy 
        flash[:notice] = "Mod has been deleted"
        redirect_to mods_path
    end 

    private 

    def user_params 
        params.require(:mod.permit(:name)
    end 

    def find_user
        @mod = Mod.find(params[:id])
    end

end
