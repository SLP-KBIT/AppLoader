# == Schema Information
#
# Table name: games_tags
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  tag_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :games_tag, :class => 'GamesTags' do
    game_id 1
tag_id 1
  end

end
