# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  picture    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :picture do
    game_id 1
    picture 'MyString'
  end
end
