# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  summary    :text             not null
#  icon       :string
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { build(:group) }

  context 'when has necessary parameters' do
    it { expect(group).to be_valid }
  end

  context 'when name is nil' do
    it do
      group.name = nil
      group.valid?
      expect(group.errors[:name]).to include("can't be blank")
    end
  end

  context 'when summary is nil' do
    it do
      group.summary = nil
      group.valid?
      expect(group.errors[:summary]).to include("can't be blank")
    end
  end

  context 'when icon is invalid format' do
    it do
      group.icon = 'hoge.exe'
      group.valid?
      expect(group.errors[:icon]).to include('is invalid')
    end
  end
end
