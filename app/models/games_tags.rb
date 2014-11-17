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

class GamesTags < ActiveRecord::Base
  belong_to :game
  belong_to :tag
end
