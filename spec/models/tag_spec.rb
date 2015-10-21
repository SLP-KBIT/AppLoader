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
  let(:tag) { build(:tag) }

  context 'when has necessary parameters' do
    it { expect(tag).to be_valid }
  end

  context 'when name is nil' do
    it do
      tag.name = nil
      tag.valid?
      expect(tag.errors[:name]).to include("can't be blank")
    end
  end

  context 'when has a duplicate name' do
    it do
      tag.save
      duplicate_tag = Tag.new(name: tag.name)
      duplicate_tag.valid?
      expect(duplicate_tag.errors[:name]).to include('has already been taken')
    end
  end
end
