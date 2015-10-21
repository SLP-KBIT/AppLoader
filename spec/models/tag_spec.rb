# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'when has necessary parameters' do
    let(:tag) { build(:tag) }
    it { expect(tag).to be_valid }
  end

  context 'when name is nil' do
    let(:tag) { build(:tag, name: nil) }
    it do
      tag.valid?
      expect(tag.errors[:name]).to include("can't be blank")
    end
  end

  context 'when has a duplicate name' do
    let(:tag) { create(:tag) }
    it do
      duplicate_tag = Tag.new(name: tag.name)
      duplicate_tag.valid?
      expect(duplicate_tag.errors[:name]).to include('has already been taken')
    end
  end
end
