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
    title 'Title1'
    icon 'sample.png'
    summary 'hoge'
    version '1.0'
    game_file 'dammy.exe'
    dl_count 0
    format 'DOWNLOAD'
    association :group
  end

  sequence :title do |n|
    "Title#{n}"
  end

  sequence :updated_at do |n|
    n.days.ago
  end

  factory :games, class: Game do
    title
    icon 'sample.png'
    summary 'hoge'
    version '1.0'
    game_file 'dammy.exe'
    dl_count { rand(1..100) }
    format 'DOWNLOAD'
    association :group
    updated_at
  end
end
