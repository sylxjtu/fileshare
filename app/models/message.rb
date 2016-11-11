class Message < ApplicationRecord
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'

  validates :from_user,
    presence: true

  validates :to_user,
    presence: true

  validates :title,
    presence: true,
    length: { maximum: 100 }

  validates :content,
    presence: true
end
