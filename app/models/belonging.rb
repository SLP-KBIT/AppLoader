# == Schema Information
#
# Table name: belongings
#
#  id       :integer          not null, primary key
#  user_id  :integer          not null
#  group_id :integer          not null
#

class Belonging < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :user_id, presence: true, format: { with: /\A[0-9]+\Z/i },
                      inclusion: { in: proc { User.pluck(:id) } }
  validates :group_id, presence: true, format: { with: /\A[0-9]+\Z/i },
                       inclusion: { in: proc { Group.pluck(:id) } }
end
