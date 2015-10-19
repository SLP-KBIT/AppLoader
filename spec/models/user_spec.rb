# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  account         :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  enable_flag     :boolean          default(TRUE), not null
#  admin_flag      :boolean          default(FALSE), not null
#  icon            :string
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
