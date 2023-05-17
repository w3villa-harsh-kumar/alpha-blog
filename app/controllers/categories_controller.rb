class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update]
    before_action :require_user, except: [:index, :show]
    before_action :require_admin, except: [:index, :show]

    def index
        @categories = Category.paginate(page: params[:page], per_page: 6)
    end

    def new
        @category = Category.new
    end
    
    def create
        # create a new category with the name from the form
        # if the category is saved, redirect to the category show page
        # if the category is not saved, render the new category form again

        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "The category has been created."
            redirect_to @category
        else
            return render(:new, status: :unprocessable_entity, locals: { category: @category })
        end
    end

    def show
        @categories = Category.paginate(page: params[:page], per_page: 6)
    end

    def edit
    end

    def update
        if @category.update(category_params)
            flash[:notice] = "The category has been updated."
            redirect_to @category
        else
            return render(:edit, status: :unprocessable_entity, locals: { category: @category })
        end
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end

    def set_category
        @category = Category.find(params[:id])
    end

    def require_admin
        if !logged_in? || (logged_in? && !(current_user.usertype == "admin"))
            flash[:alert] = "Only admins can perform that action."
            redirect_to categories_path
        end
    end

end