class Member < ActiveRecord::Base
  
  ratyrate_rater
  
  # Associations
  has_many :ads
  #accepts_nested_attributes_for :profile_member

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
