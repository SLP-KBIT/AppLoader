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
end
