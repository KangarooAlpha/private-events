class Event < ApplicationRecord
  has_many :users
  belongs_to :creater, class_name: "User", foreign_key: "creater_id"
  has_many :attendees, through: :attendances, source: :user
end
