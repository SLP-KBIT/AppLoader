# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  summary    :text             not null
#  icon       :string
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  has_many :games
  has_many :belongings
  has_many :users, through: :belongings
end
