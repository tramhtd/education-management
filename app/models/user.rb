class User < ApplicationRecord
  has_secure_password

  validates :name,
    presence: true,
    length: {maximum:50}

  validates :address,
    presence: true,
    length: {maximum:100}

  validates :username,
    presence: true,
    length: {maximum:50}
    uniqueness: { case_sensitive: false }

  validates :password,
    presence: true,
    confirmation: true,
    length: { within: 6..50 }, 
    on: :create

  validates :password,
    confirmation: true,
    length: { within: 6..50 }, 
    allow_blank: true,
    on: :update

end
