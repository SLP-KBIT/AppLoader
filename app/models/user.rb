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
  has_and_belongs_to_many :groups
end
