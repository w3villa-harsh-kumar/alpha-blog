## Resource in Rails

### 1. What is a Resource in Rails?
A resource is the term used for a collection of similar objects, such as articles, people or animals. You can create, read, update and destroy items for a resource and these operations are referred to as CRUD operations.
The terms used for a resource are as follows:
1. Model: The model is the class that describes the resource. It contains the attributes and methods to manipulate the resource.
2. View: The view is the HTML representation of the resource. It is the user interface.
3. Controller: The controller is the class that contains the actions to manipulate the resource. It is the interface between the user, the view and the model.
4. Database: The database is the storage for the resource. It is used to store the data for the resource. It can be a relational database such as MySQL or a NoSQL database such as MongoDB. It contains the tables for the resource.

### 2. How to create a Resource in Rails?
To create a resource in Rails, you need to create a model, a view and a controller. You can use the scaffold generator to create all three at once. The scaffold generator creates a model, a view and a controller for the resource. It also creates a database migration to create the table for the resource in the database.

### 3. How to create a Resource in Rails using the scaffold generator?
To create a resource in Rails using the scaffold generator, you need to run the following command:
``` 
$ rails generate scaffold <resource_name> <attribute_name>:<data_type> <attribute_name>:<data_type> ...
```
For example, to create a resource called Article with the attributes title and text, you need to run the following command:
```
$ rails generate scaffold Article title:string text:text 
```
After running the above command, you need to run the following command to run the migration:
``` 
$ rails db:migrate
```
The above command will create the table for the resource in the database.

### 4. Naming Conventions for Resources in Rails
The naming conventions for resources in Rails are as follows:
1. The model name is singular and the controller name is plural.
2. The model name is capitalized and the controller name is camel case.
3. The table name is plural and the model name is singular.

e.g. The model name for the resource **article** is **article** and the controller name is **articles**. The table name is **articles**.
=> Models
```
Model Name: article
Article model file: app/models/article.rb
Article model class: Article
```
=> Controllers
```
Controller Name: articles
Articles controller file: app/controllers/articles_controller.rb
Articles controller class: ArticlesController
```
=> Views
```
View directory: app/views/articles
View file for index action: app/views/articles/index.html.erb
View file for show action: app/views/articles/show.html.erb
```
=> Database
```
Database table name: articles
```

### 5. How to create a Resource in Rails without using the scaffold generator?
To create a resource in Rails without using the scaffold generator, you need to create a model, a view and a controller manually. You can use the rails generate command to create the model and the controller. You can create the view manually.

```
Step 1: Generate a migration for the resource using the rails generate migration command.
```
```
Step 2: Add the columns to the migration file.
```
```
Step 3: Run the migration using the rails db:migrate command.
```

**Note:** 
```
If you want to add a column to an existing table, you need to create a new migration using the rails generate migration command and add the column to the migration file. Then, you need to run the migration using the rails db:migrate command. (Recommended way to add a column to an existing table)

OR

you can rollback the migration using the rails db:rollback command and then run the migration again using the rails db:migrate command.(This is not recommended way to add a column to an existing table as it will delete all the data in the table.)

```
```
Step:4 Set the article routes in the config/routes.rb file.
```
```
Step:5 Create a ArticlesController class in the app/controllers/articles_controller.rb file.
```
```
Step:6 Create the actions in the ArticlesController class.
```
```
Step:7 Create the views in the app/views/articles directory.
```

### 6. How to create a model for a resource in Rails?
To create a model for a resource in Rails, you need to run the following command:
```
$ rails generate model <model_name> <attribute_name>:<data_type> <attribute_name>:<data_type> ...
```
For example, to create a model for the resource article with the attributes title and text, you need to run the following command:
```
$ rails generate model Article title:string text:text
```

### 7. How to create a controller for a resource in Rails?
To create a controller for a resource in Rails, you need to run the following command:
```
$ rails generate controller <controller_name> <action_name> <action_name> ...
```
For example, to create a controller for the resource article with the actions index, show, new, edit, create, update and destroy, you need to run the following command:
```
$ rails generate controller Articles index show new edit create update destroy
```

### 8. How to create a view for a resource in Rails?
To create a view for a resource in Rails, you need to create a file with the name of the action in the app/views/<controller_name> directory. For example, to create a view for the index action of the articles controller, you need to create a file called index.html.erb in the app/views/articles directory.

### 9. How to create a database migration for a resource in Rails?
To create a database migration for a resource in Rails, you need to run the following command:
```
$ rails generate migration <migration_name>
```
For example, to create a database migration for the resource article, you need to run the following command:
```
$ rails generate migration CreateArticles
```

### 10. How to use Rails console to interact with a resource?
To use Rails console to interact with a resource, you need to run the following command:
```
$ rails console
```
This will open the Rails console. You can use the Rails console to create, read, update and destroy items for a resource.
**Create**
```
> article = Article.new(title: "Hello World", text: "This is my first article.")
> article.save
```
**Read**
```
> Article.all
> Article.find(1)
> Article.find_by(title: "Hello World")
> Article.where(title: "Hello World")
> Article.first
> Article.last
> Article.find_by_id(1)
```
**Update**
```
> article = Article.find(1)
> article.title = "Hello World"
> article.save
```
**Destroy**
```
> article = Article.find(1)
> article.destroy
```

### 11. What are validations in Rails?
Validations are used to ensure that the data entered by the user is valid. For example, if you want to ensure that the title of an article is unique, you can use the validates_uniqueness_of method in the Article model.
```
class Article < ApplicationRecord
  validates_uniqueness_of :title, presence: true
end
```
This will ensure that the title of an article is unique and it is not blank.

**Link for more information about validations in Rails:**
https://guides.rubyonrails.org/active_record_validations.html

### 12. how to see the errors in Rails?
To see the errors in Rails, you need to run the following command:
```
$ rails console
```
This will open the Rails console. You can use the Rails console to see the errors in Rails.
```
> article = Article.new(title: "Hello World", text: "This is my first article.")
> article.save
> article.errors
```
This will show the errors in Rails.

### 13. how to see the errors in Rails with full messages?
To see the errors in Rails with full messages, you need to run the following command:
```
$ rails console
```
This will open the Rails console. You can use the Rails console to see the errors in Rails with full messages.
```
> article = Article.new(title: "Hello World", text: "This is my first article.")
> article.save
> article.errors.full_messages
```
This will show the errors in Rails with full messages.

### 14. How to get the data from url in Rails?
To get the data from url in Rails, you need to use the params hash. For example, if you want to get the id of an article from the url, you can use the params[:id] method.
```
class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end
end
```
This will get the id of an article from the url and assign it to the @article variable. 

### 15. How to apply the CRUD operations on a resource in Rails?
To apply the CRUD operations on a resource in Rails, you need to create a controller for the resource and define the actions in the controller. For example, to apply the CRUD operations on the article resource, you need to create a controller called ArticlesController and define the actions in the controller.
```
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
```
This will create a controller for the article resource and define the actions in the controller.

### 16. How to create a form for a resource in Rails?
To create a form for a resource in Rails, you need to create a file with the name of the action in the app/views/<controller_name> directory. For example, to create a form for the new action of the articles controller, you need to create a file called new.html.erb in the app/views/articles directory.
```
<%= form_with model: @article, local: true do |form| %>
  <p>
    <%= form.label :title %><br>
    <%= form.text_field :title %>
  </p>

  <p>
    <%= form.label :text %><br>
    <%= form.text_area :text %>
  </p>

  <p>
    <%= form.submit %>
  </p>
<% end %>
```

### 17. How to create a form for a resource in Rails with validations?
To create a form for a resource in Rails with validations, you need to create a file with the name of the action in the app/views/<controller_name> directory. For example, to create a form for the new action of the articles controller, you need to create a file called new.html.erb in the app/views/articles directory.
```
<%= form_with model: @article, local: true do |form| %>
  <% if @article.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@article.errors.count, "error") %> prohibited this article from being saved:</h2>

      <ul>
      <% @article.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <p>
    <%= form.label :title %><br>
    <%= form.text_field :title %>
  </p>

  <p>
    <%= form.label :text %><br>
    <%= form.text_area :text %>
  </p>

  <p>
    <%= form.submit %>
  </p>
<% end %>
```

### 18. How to redirect to a page in Rails?
To redirect to a page in Rails, you need to use the redirect_to method. For example, if you want to redirect to the articles index page, you can use the following code:
```
redirect_to articles_path
```
This will redirect to the articles index page.

### 19. How to make _path variable in Rails?
To make _path variable in Rails, you need to use the _path method. For example, if you want to make a variable called articles_path, you can use the following code:
```
articles_path = "/articles"
edit_article_path = "/articles/:id/edit"
root_path = "/"
```
This will make the articles_path variable.

### 20. How to make _url variable in Rails?
To make _url variable in Rails, you need to use the _url method. For example, if you want to make a variable called articles_url, you can use the following code:
```
articles_url = "http://localhost:3000/articles"
edit_article_url = "http://localhost:3000/articles/:id/edit"
root_url = "http://localhost:3000/"
```
This will make the articles_url variable.

### 21. How to make a link with custom text and custom class in Rails?
A. To make a link with custom text in Rails, you need to use the link_to method. For example, if you want to make a link with the text "Hello World", you can use the following code:
```
<%= link_to "Hello World", articles_path %>
```
This will make a link with the text "Hello World".

B. To make a link with custom class in Rails, you need to use the link_to method. For example, if you want to make a link with the class "btn btn-primary", you can use the following code:
```
<%= link_to "Hello World", articles_path, class: "btn btn-primary" %>
```
This will make a link with the class "btn btn-primary".

### 22. How to make reduce the repetition of code in Rails?
To reduce the repetition of code in Rails, you need to use the partials. For example, if you want to reduce the repetition of code in the articles index page, you can use the following code:
```
<%= render partial: "article", collection: @articles %>
```
This will reduce the repetition of code in the articles index page.

### 23. How to make a partial in Rails?
To make a partial in Rails, you need to create a file with the name of the partial in the app/views/<controller_name> directory. For example, to make a partial called _article.html.erb in the app/views/articles directory, you need to create a file called _article.html.erb in the app/views/articles directory.
```
<%= link_to article.title, article_path(article) %>
```

### 24. How to make a partial in Rails with a local variable?
To make a partial in Rails with a local variable, you need to create a file with the name of the partial in the app/views/<controller_name> directory. For example, to make a partial called _article.html.erb in the app/views/articles directory, you need to create a file called _article.html.erb in the app/views/articles directory.
```
<%= link_to article.title, article_path(article) %>
```

### 25. what is DRY in Rails?
DRY stands for Don't Repeat Yourself. It is a principle of software development that states that "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system". In Rails, it means that you should not repeat yourself in your code. For example, if you have a piece of code that is repeated in multiple places, you should extract it into a method or a partial.
  
### 26. what is association in Rails?
Association is a way to connect two models together. For example, if you have a User model and a Article model, you can connect them together by adding a has_many :articles to the User model and a belongs_to :user to the Article model.
e.g.
```
class User < ApplicationRecord
  has_many :articles
end

class Article < ApplicationRecord
  belongs_to :user
end
```

### 27. How many types of associations are there in Rails?
There are four types of associations in Rails:
1. belongs_to
2. has_one
3. has_many
4. has_and_belongs_to_many

**belongs_to**
belongs_to is used to connect two models together. For example, if you have a User model and a Article model, you can connect them together by adding a belongs_to :user to the Article model.
e.g.
```
class User < ApplicationRecord
  has_many :articles
end

class Article < ApplicationRecord
  belongs_to :user
end
```
Other examples:
-> User and Post Example
```
class User < ApplicationRecord
  has_many :posts
end

class Post < ApplicationRecord
  belongs_to :user
end
```
-> User and Comment Example
```
class User < ApplicationRecord
  has_many :comments
end

class Comment < ApplicationRecord
  belongs_to :user
end
```
-> User and Like Example
```
class User < ApplicationRecord
  has_many :likes
end

class Like < ApplicationRecord
  belongs_to :user
end
```

**has_one**
has_one is used to connect two models together. For example, if you have a User model and a Article model, you can connect them together by adding a has_one :user to the Article model.
e.g.
```
class User < ApplicationRecord
  has_many :articles
end

class Article < ApplicationRecord
  has_one :user
end
```

**has_many**
has_many is used to connect two models together. For example, if you have a User model and a Article model, you can connect them together by adding a has_many :articles to the User model.
e.g.
```
class User < ApplicationRecord
  has_many :articles
end

class Article < ApplicationRecord
  belongs_to :user
end
```

**has_and_belongs_to_many**
has_and_belongs_to_many is used to connect two models together. For example, if you have a User model and a Article model, you can connect them together by adding a has_and_belongs_to_many :users to the Article model.
e.g.
```
class User < ApplicationRecord
  has_many :articles
end

class Article < ApplicationRecord
  has_and_belongs_to_many :users
end
```

**References**
https://guides.rubyonrails.org/association_basics.html

### 28. Steps to add association in Rails?
To add association in Rails, you need to add the following code to the model:
```
class User < ApplicationRecord
  has_many :articles
end

class Article < ApplicationRecord
  belongs_to :user
end
```

<!-- 
@user.new_record? => this will return true if the user is not saved in the database yet.

@user.save => this will save the user in the database.

@user.save! => this will save the user in the database and raise an exception if there is an error.

@user.update => this will update the user in the database.

@user.update! => this will update the user in the database and raise an exception if there is an error.

@user.destroy => this will destroy the user in the database.

@user.destroy! => this will destroy the user in the database and raise an exception if there is an error.

@user.valid? => this will return true if the user is valid.

@user.invalid? => this will return true if the user is invalid.

@user.errors => this will return the errors of the user.

@user.errors.full_messages => this will return the full messages of the errors of the user.

@user.errors.any? => this will return true if the user has any errors.

@user.errors.count => this will return the number of errors of the user.

@user.errors.details => this will return the details of the errors of the user.

@user.errors.messages => this will return the messages of the errors of the user.

@user.class => this will return the class of the user.

@user.class.name => this will return the name of the class of the user.

@user.class.superclass => this will return the superclass of the class of the user.

 -->