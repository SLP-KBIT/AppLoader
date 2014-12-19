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

class Game < ActiveRecord::Base
  belongs_to :group
  has_many :picture
  has_many :comments
  has_and_belongs_to_many :tags
  DL_TOP = 5
  NEW_TOP = 10
  scope :dl_top, -> {order("dl_count").first(DL_TOP)}
  scope :new_top, -> {order("created_at").first(NEW_TOP)}
end
