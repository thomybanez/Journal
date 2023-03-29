require 'bcrypt'

class User < ApplicationRecord 
  attr_accessor :confirm_password
  validates :username, presence: true, uniqueness: true  
  has_secure_password
  has_many :categories
  has_many :tasks, through: :categories


  def self.authenticate(username, password)
    user = find_by(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end  

  def owned_categories
    categories.where(user_id: self.id)
  end
end

