class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price , :image, :remote_image_url
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_reputation :votes, source: :user, aggregated_by: :sum
end
