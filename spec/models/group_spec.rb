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

require 'rails_helper'

RSpec.describe Group, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
