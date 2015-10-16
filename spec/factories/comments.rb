# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  game_id     :integer          not null
#  content     :text             not null
#  contributor :string           not null
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :comment do
    game_id 1
    comment 'MyText'
    contributor 'MyString'
  end
end
