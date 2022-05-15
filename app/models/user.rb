class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :schedules, dependent: :destroy
  has_many :schedule_bases, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :username, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
end
