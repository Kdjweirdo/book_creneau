class UsersController < ApplicationController
    def new
        user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            reset_session
            log_in @user
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
        else
            render 'new'
            flash[:error] = "Erreur"
        end
    end
end