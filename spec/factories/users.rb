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

FactoryGirl.define do
  factory :user do
    account 'MyString'
    name 'MyString'
    password_digest 'MyString'
    enable_flag false
    admin_flag false
    icon 'MyString.png'
  end
end
