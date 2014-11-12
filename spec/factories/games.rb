# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  icon       :string(255)      not null
#  group_id   :integer          not null
#  summary    :text             not null
#  version    :string(255)      not null
#  game_file  :string(255)      not null
#  dl_count   :integer          default(0), not null
#  movie      :string(255)
#  format     :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :game do
    title "MyString"
icon "MyString"
group_id 1
summary "MyText"
version "MyString"
game_file "MyString"
dl_count 1
movie "MyString"
format "MyString"
  end

end
