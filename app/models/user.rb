class User < ApplicationRecord
  FUTURE_ERROR = "cannot be in the future"
  MINOR_ERROR = "cannot be under 18 years"

  validates :birthday, presence: true, date: true
  validates :birthday, date: { before: Date.today, message: FUTURE_ERROR }
  validates :birthday, date: { before: 18.years.ago, message: MINOR_ERROR }
  validates :height, presence: true
  validates :height, numericality: { greater_than_or_equal_to: 0.5 }
  validates :height, numericality: { less_than: 3 }
  validates :sex, presence: true

  devise :confirmable,
    :database_authenticatable,
    :lockable,
    :recoverable,
    :registerable,
    :rememberable,
    :trackable,
    :validatable

  enum sex: { female: 'female', male: 'male' }

  def age
    ((Time.current - birthday.to_time) / 1.year.seconds).floor
  end
end
