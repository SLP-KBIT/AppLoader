# == Schema Information
#
# Table name: users_groups
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class UsersGroups < ActiveRecord::Base
end
