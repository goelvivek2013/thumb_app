class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price , :image, :remote_image_url
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_reputation :votes, source: :user, aggregated_by: :sum

	def count_positive
	  evaluations.where( target_type: self.class, target_id: self.id, value: 1.0 ).count
	end

	def count_negative
	  evaluations.where( target_type: self.class, target_id: self.id, value: -1.0 ).count
	end

end
