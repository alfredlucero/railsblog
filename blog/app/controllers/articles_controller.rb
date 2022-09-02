# Inherits from ApplicationController so we don't need require "application_controller"
# Application classes and modules are available everywhere. You shouldn't need to load anything under app with require = autoloading feature
# You only need require calls for: loading files under lib directory and loading gem dependencies that have require: false in the Gemfile
class ArticlesController < ApplicationController
  def index
    # By default action is empty; when action does not explicitly render a view or trigger an HTTP response, Rails will automatically render a view
    # that matches the name of the controller and action
    # See app/views/articles/index.html.erb by default will be rendered
  end
end
