# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  account         :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  enable_flag     :boolean          default(TRUE), not null
#  admin_flag      :boolean          default(FALSE), not null
#  icon            :string
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_many :belongings
  has_many :groups, through: :belongings

  validates :account, presence: true, uniqueness: true,
                      format: { with: /\A[0-9a-zA-Z]+\Z/i }
  validates :icon,    presence: true,
                      format: { with: /\A[0-9a-zA-Z.]+\Z/i }
  validates :name, :password_digest, presence: true
  validates :enable_flag, :admin_flag, inclusion: [true, false]
end
