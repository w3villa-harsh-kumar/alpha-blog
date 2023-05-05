class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def Create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "User was created successfully."
            redirect_to @user
        else
            return render(:new, status: :unprocessable_entity, locals: { user: @user }) unless result
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end