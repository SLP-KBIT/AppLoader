# == Schema Information
#
# Table name: taggings
#
#  id      :integer          not null, primary key
#  game_id :integer          not null
#  tag_id  :integer          not null
#

require 'rails_helper'

RSpec.describe Tagging, type: :model do
  let(:tag1) { create(:tag) }
  let(:tag2) { create(:tag) }
  let(:game) { create(:game, tags: [tag1, tag2]) }

  context 'hoge' do
    it do

    end
  end
end
