# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  summary    :text             not null
#  icon       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  has_many :games
  has_many :belongings
  has_many :users, through: :belongings

  validates :name, :summary, presence: true
  validates :icon, presence: true,
                   format: { with: /\A[0-9a-zA-Z.]+\Z/i }
end
