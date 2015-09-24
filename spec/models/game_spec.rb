# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  icon       :string(255)      not null
#  group_id   :integer          not null
#  summary    :text             not null
#  version    :string(255)      not null
#  game_file  :string(255)      not null
#  dl_count   :integer          default(0), not null
#  movie      :string(255)
#  format     :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Game, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe Game do
    it "is valid with a title, icon, group_id, summary, version, game_file, dl_count, format"
    it "is invalid without a title"
    it "is invalid without a icon"
    it "is invalid without a group_id"
    it "is invalid without a summary"
    it "is invalid without a version"
    it "is invalid without a game_file"
    it "is invalid without a dl_count"
    it "is invalid without a format"
    it "is invalid with a duplicate title"
    it "is invalid without a included group_id in Group"
  end
end
