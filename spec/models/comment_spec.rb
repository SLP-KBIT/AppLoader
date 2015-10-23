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
  let(:comment) { build(:comment) }

  context 'when has necessary parameters' do
    it { expect(comment).to be_valid }
  end

  context 'when game_id is nil' do
    it do
      comment.game_id = nil
      comment.valid?
      expect(comment.errors[:game_id]).to include('is not included in the list')
    end
  end

  context 'when content is nil' do
    it do
      comment.content = nil
      comment.valid?
      expect(comment.errors[:content]).to include("can't be blank")
    end
  end

  context 'when contributor is nil' do
    it do
      comment.contributor = nil
      comment.valid?
      expect(comment.contributor).to eq '名無し'
    end
  end
end
