class Article < ApplicationRecord
  acts_as_paranoid

  mount_uploader :picture, PictureUploader

  has_many :articles_tags
  has_many :favorites
  has_many :comments
  belongs_to :category
  belongs_to :user
  has_many :tags, through: :articles_tags

  validates :name, :presence => {:message => "Vui lòng nhập tên bài viết!!!" }
  validates :description, :presence => {:message => "Vui lòng nhập mô tả bài viết!!!" }
  validates :detail, :presence => {:message => "Vui lòng nhập chi tiết bài viết!!!" }
  validates :category_id, :presence => {:message => "Vui lòng chọn danh mục bài viết!!!" }

  scope :with_count_favorites, -> {joins(:favorites).select("articles.* ,Count(favorites.id) AS favorite_count").group("articles.id")}

end
