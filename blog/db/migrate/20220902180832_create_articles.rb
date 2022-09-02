# Migrations are used to alter the structure of an application's database
# Run the migration with bin/rails db:migrate
# Run bin/rails console to automatically load Rails and application code in an interactive coding environment
# Issue command like article = Article.new(title: "Hello Rails", body: "I am on Rails!")
# This initializes the object but we must save with .save i.e. article.save
# This performs a transaction to insert into the articles table
# Typing article again in the console will have id, updated_at, created_at no longer nil
# Article.find(1) will give us back that article we saved too
# Article.all will also give us back all articles from the database - returns back ActiveRecord::Relation object which is like a super-powered array
class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    # default adds an id column as auto-incrementing primary key
    # title and body columns
    create_table :articles do |t|
      t.string :title
      t.text :body

      # default adds created_at and updated_at columns and Rails manages these for us in setting values when we create or update a model object
      t.timestamps
    end
  end
end
