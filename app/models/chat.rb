class Chat < ApplicationRecord
  belongs_to :user
  has_many :groups, dependent: :destroy
  validates :name, presence: true
  validates :chat_id, presence: true, uniqueness: true
end
