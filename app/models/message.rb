class Message < ApplicationRecord
  belongs_to :fromuser, :classname 'User'
  belongs_to :touser, :classname 'User'
end
