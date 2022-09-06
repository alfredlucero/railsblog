# Inherits from ApplicationController so we don't need require "application_controller"
# Application classes and modules are available everywhere. You shouldn't need to load anything under app with require = autoloading feature
# You only need require calls for: loading files under lib directory and loading gem dependencies that have require: false in the Gemfile
class ArticlesController < ApplicationController
  # High Level when we go to http://localhost:3000
  # 1. Rails application receives request from GET http://localhost:3000
  # 2. Rails router maps root route to index action of ArticlesController
  # 3. index action uses the Article model to fetch all articles in the database
  # 4. Rails automatically renders app/views/articles/index.html.erb view
  # 5. ERB code in view is evaluated to output HTML
  # 7. Server sends response containing HTML back to browser

  def index
    # By default action is empty; when action does not explicitly render a view or trigger an HTTP response, Rails will automatically render a view
    # that matches the name of the controller and action
    # See app/views/articles/index.html.erb by default will be rendered
    
    # Fetch all articles from database
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # Instantiates a new article but does not save it; this article will be used in the view when building the form
  # By default, the new action will render articles/new.html.erb
  # GET /articles/new is mapped to this action; it doesn't attempt to save @article
  def new
    @article = Article.new
  end

  # When we submit the new form, the POST /articles request is mapped to this create action
  # It does attempt to save @article and validations are checked
  def create
    @article = Article.new(article_params)
    
    # If saved successfully, action redirects browser to article's page at http://localhost:3000/articles/#{@article.id}
    if @article.save
      # redirect_to causes browser to make a new request; improtant to use this after mutating database or application state
      # otherwise if user refreshes the page, the browser will make the same request and mutation will be repeated
      redirect_to @article
    # Otherwise, action redisplays form by rendering new.html.erb with status code 422 with the error messages
    else
      # Render = render specified view for current request
      render :new, status: :unprocessable_entity
    end
  end

  # Edit the form; fetch article from database first and store in article so it can be used when building the form
  # By default the edit action will render edit.html.erb
  def edit
    @article = Article.find(params[:id])
  end

  # Carry out the update; refetches the article from the databse and attempts to update it with the submitted form data
  # from article_params; if no validations fail and update is successful, action redirects browser to article's page; else action redisplays the form with error messages in edit.html.erb
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  # Fetches article from database and calls destroy on it; redirects browser to root path with 303 see other status
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    # Using strong parameters to extract out form field paramaters
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
