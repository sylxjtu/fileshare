class User < ApplicationRecord
  has_many :memberships
  has_many :groups, through: :memberships

  validates :username,
    presence: true,
    uniqueness: true,
    length: { maximum: 20 }

  validates :nickname,
    presence: true,
    length: { maximum: 20 }

  validates :password,
    presence: true,
    confirmation: true,
    length: { maximum: 20 }

  validates :password_confirmation,
    presence: true
end
