class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
	has_many :books
	has_many :relationships, foreign_key: 'follower_id'
	has_many :followings, through: :relationships, source: :following
	has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'following_id'
	has_many :followers, through: :reverse_of_relationships, source: :follower
	
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  
  def followings?(user)
    followings_user.include?(user)
    
    
  attachment :profile_image, destroy: false

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50}
end
