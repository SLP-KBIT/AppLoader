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
  let(:tagging) { build(:tagging) }

  context 'when has a necessary parameters' do
    it { expect(tagging).to be_valid }
  end

  context 'when game_id is nil' do
    it do
      tagging.game_id = nil
      tagging.valid?
      expect(tagging.errors[:game_id]).to include('is not included in the list')
    end
  end

  context 'when game_id is not exist' do
    it do
      tagging.game_id = 0
      tagging.valid?
      expect(tagging.errors[:game_id]).to include('is not included in the list')
    end
  end

  context 'when tag_id is nil' do
    it do
      tagging.tag_id = nil
      tagging.valid?
      expect(tagging.errors[:tag_id]).to include('is not included in the list')
    end
  end

  context 'when tag_id is not exist' do
    it do
      tagging.tag_id = 0
      tagging.valid?
      expect(tagging.errors[:tag_id]).to include('is not included in the list')
    end
  end
end
