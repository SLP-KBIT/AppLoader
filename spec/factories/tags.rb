# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :tag do
    name 'MyString'
  end
end
