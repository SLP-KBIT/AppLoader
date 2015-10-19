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
  validates :group_id, inclusion: { in: proc { Group.pluck(:id) } }, presence: true
  validates :summary, :version, :format, presence: true
  validates :icon, :game_file, presence: true,
                               format: { with: /\A[0-9a-zA-Z.]+\Z/i }
  validates :movie, format: { with: /\A[0-9a-zA-Z.]*\Z/i }
  validates :group_id, :dl_count, presence: true,
                                  format: { with: /\A[0-9]+\Z/i }

  DL_TOP = 5
  NEW_TOP = 10

  scope :dl_top, -> (num = DL_TOP) { order('dl_count desc').first(num) }
  scope :new_top, -> (num = NEW_TOP) { order('updated_at desc').first(num) }
end
