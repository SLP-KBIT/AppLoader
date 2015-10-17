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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
