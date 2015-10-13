# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  account         :string(255)
#  name            :string(255)
#  password_digest :string(255)
#  enable_flag     :boolean
#  admin_flag      :boolean
#  icon            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_many :belongings
  has_many :groups, through: :belongings

  validates :account, presence: true, uniquness: true,
                      format: { with: /\A[0-9a-zA-Z]+\Z/i }
  validates :icon,    presence: true,
                      format: { with: /\A[0-9a-zA-Z]+\Z/i }
end
