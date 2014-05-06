class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :products , dependent: :destroy
  has_reputation :votes, source: {reputation: :votes, of: :products}, aggregated_by: :sum
  has_many :evaluations, class_name: ReputationSystem::Evaluation, as: :source

  def voted_for?(product)
  evaluations.where(target_type: product.class, target_id: product.id).present?
end
end
