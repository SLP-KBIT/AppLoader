# == Schema Information
#
# Table name: pictures
#
#  id           :integer          not null, primary key
#  game_id      :integer          not null
#  picture_file :string           not null
#  created_at   :datetime
#  updated_at   :datetime
#

FactoryGirl.define do
  factory :picture do
    association :game
    picture_file 'MyString.png'
  end
end
