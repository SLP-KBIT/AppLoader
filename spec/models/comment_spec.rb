# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  game_id     :integer
#  comment     :text
#  contributor :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Comment, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
