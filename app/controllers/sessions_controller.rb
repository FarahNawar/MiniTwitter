class SessionsController < ApplicationController

    def new
        
    end
    
    def create
        @user = User.find_by(email: params[:email])

        if @user.nil? || @user.authenticate(params[:password]) == false
            flash[:notice]=" Wrong email or password. Try again."
            redirect_to login_path
        else
            session[:user_id]=@user.id
            redirect_to user_path(@user.id)
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path
    end

end
