class Group < ApplicationRecord
  belongs_to :chat
  validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true
  validate :nick

  def nick
    return if nickname.split.all?{|word| word.starts_with?('@') }

    errors.add(:nickname, 'должны начинаться с @')
  end
end
