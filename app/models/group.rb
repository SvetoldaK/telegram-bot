class Group < ApplicationRecord
  belongs_to :chat
  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true
end
