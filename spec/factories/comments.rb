# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  game_id     :integer
#  comment     :text
#  contributor :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :comment do
    game_id 1
comment "MyText"
contributor "MyString"
  end

end
