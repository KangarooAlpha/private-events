class Event < ApplicationRecord
  scope :past, -> { where("date < ?", Date.today) }
  scope :future, -> { where("date > ?", Date.today) }
  has_many :users
  belongs_to :creater, class_name: "User", foreign_key: "creater_id"
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
end
