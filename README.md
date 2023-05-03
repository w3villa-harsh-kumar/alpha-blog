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

