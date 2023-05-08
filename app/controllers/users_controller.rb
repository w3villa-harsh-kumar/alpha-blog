class UsersController < ApplicationController
    before_action :get_user_by_id, only: [:show, :edit, :update, :destroy]

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

    def show
        @articles = @user.articles
    end

    def edit
    end

    def update
        result = @user.update(user_params)
        if result
            flash[:notice] = "Hi, #{user_params[:username]}!, you have successfully updated your account."
            redirect_to @user
        else
            return render(:edit, status: :unprocessable_entity, locals: { user: @user }) unless result
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def get_user_by_id
        result = User.find_by_id(params[:id])
        if result
            @user = result
        else
            flash[:alert] = "User with id #{params[:id]} does not exist."
            redirect_to users_path
        end
    end

end