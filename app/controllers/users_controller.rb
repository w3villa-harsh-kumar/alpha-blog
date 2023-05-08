class UsersController < ApplicationController
    before_action :get_user_by_id, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index, :new, :create]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @users = User.paginate(page: params[:page], per_page: 6)
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        result = @user.save
        if result
            flash[:notice] = "Welcome to the Alpha Blog, #{user_params[:username]}!, you have successfully signed up."
            session[:user_id] = @user.id
            redirect_to @user
            # debugger
        else
            return render(:new, status: :unprocessable_entity, locals: { user: @user }) unless result
        end
    end

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 6)
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

    def destroy
        @user.destroy
        session[:user_id] = nil
        flash[:notice] = "Your account and all associated articles have been deleted."
        redirect_to root_path
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

    def require_same_user
        if current_user != @user
            flash[:alert] = "You can only edit or delete your own account."
            redirect_to @user
        end
    end

end