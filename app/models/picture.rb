# == Schema Information
#
# Table name: pictures
#
#  id           :integer          not null, primary key
#  game_id      :integer          not null
#  picture_file :string           not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Picture < ActiveRecord::Base
  belongs_to :game

  validates :game_id, presence: true,
                      inclusion: { in: proc { Game.pluck(:id) } }
  validates :picture_file, presence: true, uniqueness: true,
                           format: { with: /\A[0-9a-z]+\.(png|jpeg|jpg)\Z/i }
end
