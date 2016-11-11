class User < ApplicationRecord
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :sent_messages,
    class_name: "Message",
    foreign_key: "from_user"
  has_many :recieved_messages,
    class_name: "Message",
    foreign_key: "to_user"

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
