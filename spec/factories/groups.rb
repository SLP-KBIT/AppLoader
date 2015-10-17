# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  summary    :text             not null
#  icon       :string
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :group do
    name 'Group1'
    summary 'hoge'
    icon 'hoge.png'
  end
end
