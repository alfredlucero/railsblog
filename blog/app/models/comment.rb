class Comment < ApplicationRecord
  # Active Record association with :references keyword in shell command - article_id foreign key
  # Each comment belongs to one article; one article can have many comments
  belongs_to :article
end
