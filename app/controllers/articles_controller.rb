class ArticlesController < ApplicationController

    def show
        # debugger
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
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

        @article = Article.new(params[:article].permit(:title, :description, :author))
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
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        result = @article.update(params[:article].permit(:title, :description, :author))
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
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was deleted successfully."
        redirect_to articles_path
    end
end