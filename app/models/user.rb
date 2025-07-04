# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean
#  bio                    :text
#  class_year             :integer
#  email                  :string
#  encrypted_password     :string
#  listings_count         :integer
#  name                   :string
#  password               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings,
           class_name: "Ticket",
           foreign_key: "seller_id",
           dependent: :destroy

  has_many :purchases,
           class_name: "Ticket",
           foreign_key: "buyer_id",
           dependent: :nullify

  has_one_attached :profile_photo

validates :name, :class_year, :email, presence: true

end
