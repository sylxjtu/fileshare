class Document < ApplicationRecord
  belongs_to :group
  attr_accessor :content

  validates :filename,
    presence: true,
    length: { maximum: 20 }

end
