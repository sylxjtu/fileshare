class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :documents

  validates :groupname,
    uniqueness: true,
    presence: true,
    length: { maximum: 20 }
end
