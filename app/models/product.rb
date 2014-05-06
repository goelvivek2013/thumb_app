class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price
  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum
end
