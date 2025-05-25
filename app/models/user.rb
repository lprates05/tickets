# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  bio            :text
#  class_year     :integer
#  email          :string
#  listings_count :integer
#  name           :string
#  password       :string
#  profile_photo  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class User < ApplicationRecord
  has_many :listings,
           class_name: "Ticket",
           foreign_key: "seller_id",
           dependent: :destroy

  has_many :purchases,
           class_name: "Ticket",
           foreign_key: "buyer_id",
           dependent: :nullify
end
