# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  summary    :text             not null
#  icon       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :group do
    name "MyString"
summary "MyText"
  end

end
