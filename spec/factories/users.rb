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

FactoryGirl.define do
  factory :user do
    account 'MyString'
    name 'MyString'
    password_digest 'MyString'
    enable_flag false
    admin_flag false
    icon 'MyString'
  end
end
