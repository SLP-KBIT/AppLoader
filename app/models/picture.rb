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

  validates :game_id, presence: true, uniqueness: true,
                      format: { with: /\A[0-9]+\Z/i }
  validates :picture, presence: true,
                      format: { with: /\A[0-9a-z]+\.(png|jpeg|jpg)\Z/i }
end
