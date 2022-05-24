class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :schedule_bases, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :task_bases, dependent: :destroy
  has_many :categories, dependent: :destroy

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[!-~&&[^a-z\d]])[!-~]{8,100}+\z/i.freeze
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'は8文字以上にしてください。英数字の両方を含む必要があります' }, if: -> {
                                                                                                                                new_record? || changes[:crypted_password]
                                                                                                                              }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  def self.demo_user_create
    random_value = SecureRandom.hex
    random_value_pass = rand(11_111..99_999)
    create!(
      username: "Guest",
      email: "demo_#{random_value}@example.com",
      password: "demou#{random_value_pass}",
      password_confirmation: "demou#{random_value_pass}"
    )
  end
end
