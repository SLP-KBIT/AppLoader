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

class Comment < ActiveRecord::Base
  belongs_to :game
end
