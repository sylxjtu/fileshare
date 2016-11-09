class Group < ApplicationRecord
  validates :groupname,
    presence: true,
    length: { maximum: 20 }
end
