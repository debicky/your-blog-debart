class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  has_one_attached :thumbnail
  has_rich_text :body
  validates :title, length: { minimum: 5}
  validates :body, length: { minimum: 25}
  validates :thumbnail, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..3.megabytes }



  extend FriendlyId
  friendly_id :title, use: :slugged




  def thumbnail_size(image,x,y)
    return image.variant(resize_to_fill:[x,y]).processed
  end


  def total_comments
    total_comments = comments.count
    comments.each do |comment|
      total_comments += comment.comments.count
    end
    total_comments
  end

end
