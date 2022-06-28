class Group < ApplicationRecord
  belongs_to :chat
  validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true
end
