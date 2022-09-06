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
end
