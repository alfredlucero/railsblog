# Model is a Ruby class used to represent data
# Models can interact with application's database through a feature of Rails called Active Record
# bin/rails generate model Article title:string body:text
# Active Record automatically defines model attributes for every table column so you don't have to declare those attributes in your model file
class Article < ApplicationRecord
  has_many :comments # Can easily retrive all comments belonging to an article with @article.comments

  # Add validations to help with invalid user input; if any of the checks fail, the save will be aborted and appropriate error messages will be added to the errors attribute of the model object
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
