class ArticlesController < ApplicationController
    before_action :get_article_by_id, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def show
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 6)
    end

    def new 
        @article = Article.new
    end

    def create
        # debugger
        #params.require(:article) is a hash that looks like this:
        # {
        #     "title" => "My Article",
        #     "description" => "My article description",
        #     "author" => "My article author"
        # }

        # params.require(:article).permit(:title, :description) is a hash that looks like this:
        # {
        #     "title" => "My Article",
        #     "description" => "My article description"
        # }

        @article = Article.new(article_params)
        @article.user = current_user
        result = @article.save
        if result
            #flash is a hash that looks like this and is used to display messages to the user this message is shown in app/views/layouts/application.html.erb
            # {
            #     "notice" => "Article was created successfully."
            # }

            flash[:notice] = "Article was created successfully."
            redirect_to @article
            # format.json { render json: @article, status: :created, location: @article }
        else
            return render(:new, status: :unprocessable_entity, locals: { article: @article }) unless result
        end
    end

    def edit
    end

    def update

        result = @article.update(article_params)
        if result
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            return render(:edit, status: :unprocessable_entity, locals: { article: @article }) unless result
            # Here we are rendering the edit.html.erb view file and passing in the article object as a local variable
            # Here Status: :unprocessable_entity is the HTTP status code for an unprocessable entity (422)
            # https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/422
        end
    end
    
    def destroy
        @article.destroy
        flash[:notice] = "Article was deleted successfully."
        redirect_to articles_path
    end

    private

        def get_article_by_id
            result = Article.exists?(params[:id])
            if result
                @article = Article.find(params[:id])
            else
                flash[:alert] = "Article with id #{params[:id]} does not exist."
                redirect_to articles_path
            end
        end

        def article_params
            params.require(:article).permit(:title, :description)
        end

        def require_same_user
            if current_user != @article.user
                flash[:alert] = "You can only edit or delete your own article."
                redirect_to @article
            end
        end
end