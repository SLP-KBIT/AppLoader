# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  icon       :string           not null
#  group_id   :integer          not null
#  summary    :text             not null
#  version    :string
#  game_file  :string
#  dl_count   :integer          default(0), not null
#  movie      :string
#  format     :string           not null
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
    movie 'hoge.avi'
    after(:create) do |game|
      create(:tagging, game: game, tag: create(:tag))
    end
  end

  sequence :title do |n|
    "Title#{n}"
  end

  sequence :updated_at do |n|
    n.days.ago
  end

  counts = [10, 8, 3, 5, 6, 7, 3, 6, 2, 1]
  sequence :dl_count do |n|
    counts[n % counts.length]
  end

  factory :games, class: Game do
    title
    icon 'sample.png'
    summary 'hoge'
    version '1.0'
    game_file 'dammy.exe'
    dl_count
    format 'DOWNLOAD'
    association :group
    updated_at
  end
end
