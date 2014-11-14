# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  picture    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Picture, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
