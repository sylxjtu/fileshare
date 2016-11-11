class Document < ApplicationRecord
  belongs_to :group

  validates :filename,
    presence: true,
    length: { maximum: 20 }

  validates :buffer,
    presence: true
end
