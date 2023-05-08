class SessionsController < ApplicationController
    def new
    end

    def create
        # debugger
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            # debugger
            session[:user_id] = user.id
            flash[:notice] = "You have successfully logged in."
            redirect_to user
        else
            flash.now[:alert] = "There was something wrong with your login details. Try again."
            return render(:new, status: :unprocessable_entity, locals: { user: user }) 
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have successfully logged out."
        redirect_to root_path
    end
end