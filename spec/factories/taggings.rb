# == Schema Information
#
# Table name: taggings
#
#  id      :integer          not null, primary key
#  game_id :integer          not null
#  tag_id  :integer          not null
#

FactoryGirl.define do
  factory :tagging do
    game
    tag
  end
end
