class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  validates :groupname,
    presence: true,
    length: { maximum: 20 }
end
