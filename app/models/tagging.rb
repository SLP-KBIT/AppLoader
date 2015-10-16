# == Schema Information
#
# Table name: taggings
#
#  id      :integer          not null, primary key
#  game_id :integer          not null
#  tag_id  :integer          not null
#

class Tagging < ActiveRecord::Base
  belongs_to :game
  belongs_to :tag
end
