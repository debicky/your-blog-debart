class Comment < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable





end
