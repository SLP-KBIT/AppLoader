# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  game_id    :integer          not null
#  picture    :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Picture < ActiveRecord::Base
  belongs_to :game
end
