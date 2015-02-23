class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates :name, 
    presence: true, 
    length: { maximum: 255 }
  validates :email, 
    presence: true, 
    length: { maximum: 255 }, 
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ },
    uniqueness: true
  validates :password,
    length: { minimum: 8 }

    has_secure_password
end
