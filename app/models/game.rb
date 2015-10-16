# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  icon       :string           not null
#  group_id   :integer          not null
#  summary    :text             not null
#  version    :string           not null
#  game_file  :string           not null
#  dl_count   :integer          default(0), not null
#  movie      :string
#  format     :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  belongs_to :group
  has_many :pictures
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, uniqueness: true, presence: true
  validates :icon, :summary, :version, :game_file, :dl_count, :format, presence: true
  validates :group_id, inclusion: { in: proc { Group.pluck(:id) } }, presence: true

  DL_TOP = 5
  NEW_TOP = 10

  scope :dl_top, -> (num = DL_TOP) { order('dl_count desc').first(num) }
  scope :new_top, -> (num = NEW_TOP) { order('updated_at desc').first(num) }
end
