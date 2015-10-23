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
    content 'hoge'
    contributor '太郎'
    association :game
  end
end
