class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        result = @user.save
        if result
            flash[:notice] = "Welcome to the Alpha Blog, #{user_params[:username]}!, you have successfully signed up."
            redirect_to @user
            # debugger
        else
            return render(:new, status: :unprocessable_entity, locals: { user: @user }) unless result
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end