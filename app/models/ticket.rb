# == Schema Information
#
# Table name: tickets
#
#  id                  :integer          not null, primary key
#  price               :float
#  status              :string
#  ticket_photo        :string
#  ticket_restrictions :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  buyer_id            :integer
#  seller_id           :integer
#
class Ticket < ApplicationRecord
  belongs_to :seller,
             class_name: "User",
             foreign_key: "seller_id",
             counter_cache: :listings_count

  belongs_to :buyer,
             class_name: "User",
             foreign_key: "buyer_id",
             optional: true

  belongs_to :event

end
