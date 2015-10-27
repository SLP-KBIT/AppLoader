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

class Game < ActiveRecord::Base
  # association
  belongs_to :group
  has_many :pictures
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  # class variable
  DL_TOP = 5
  NEW_TOP = 10

  FORMAT = { 'BROWSER' => 100, 'PC' => 200 }

  # validation
  validates :title, uniqueness: true, presence: true
  validates :group_id, inclusion: { in: proc { Group.pluck(:id) } }, presence: true
  validates :summary, presence: true
  validates :icon, presence: true, format: { with: /\A[0-9a-z]+\.(png|jpeg|jpg)\Z/i }
  validates :game_file, format: { with: /(\A[0-9a-z]+\.(exe|html)\Z)|(\A\Z)/i }
  validates :version, format: { with: /\A[0-9.]*\Z/ }

  validates :movie, format: { with: /(\A[0-9a-z]+\.(mp4|wmv|avi)\Z)|(\A\Z)/i }
  validates :group_id, :dl_count, presence: true,
                                  format: { with: /\A[0-9]+\Z/ }
  validates :format, inclusion: { in: proc { Game::FORMAT.keys } }, presence: true

  # scope
  scope :dl_top, -> (num = DL_TOP) { order('dl_count desc, title').first(num) }
  scope :new_top, -> (num = NEW_TOP) { order('updated_at desc').first(num) }

  # method
end
