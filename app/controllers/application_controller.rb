class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in? # helper_method makes these methods available to the views
        
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] # ||= means if @current_user is nil, then execute the code on the right otherwise do nothing
    end
    
    def logged_in?
        !!current_user # !! turns current_user into a boolean
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action."
            redirect_to login_path
        end
    end
    
end
