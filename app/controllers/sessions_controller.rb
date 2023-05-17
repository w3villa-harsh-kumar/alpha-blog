class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]
    def new
    end

    def create
        # debugger
        # Get the user by email
        user = User.find_by(email: params[:session][:email].downcase)

        # If the user exists and the password is correct
        if user && user.authenticate(params[:session][:password])
            # debugger
            # Save the user id in the session hash
            session[:user_id] = user.id
            flash[:notice] = "You have successfully logged in."
            redirect_to user
        else
            # debugger
            flash.now[:alert] = "There was something wrong with your login details. Try again."
            return render(:new, status: :unprocessable_entity, locals: { user: user }) 
        end
    end

    def destroy
        # Remove the user id from the session hash
        session[:user_id] = nil
        flash[:notice] = "You have successfully logged out."
        redirect_to root_path
    end

    private 

    def logged_in_redirect
        if logged_in?
            flash[:alert] = "You are already logged in."
            redirect_to root_path
        end
    end
end