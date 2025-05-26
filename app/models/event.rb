# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  category    :string
#  end_date    :date
#  end_time    :time
#  event_photo :string
#  name        :string
#  start_date  :date
#  start_time  :time
#  timezone    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_one_attached :event_photo
end
