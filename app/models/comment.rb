# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  game_id     :integer          not null
#  content     :text             not null
#  contributor :string           not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :game

  validates :content, :contributor, presence: true
  validates :game_id, inclusion: { in: proc { Game.pluck(:id) } }, presence: true

  before_validation do
    self.contributor = '名無し' if contributor.nil?
  end
end
