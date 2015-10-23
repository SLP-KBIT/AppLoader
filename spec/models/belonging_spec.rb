# == Schema Information
#
# Table name: belongings
#
#  id       :integer          not null, primary key
#  user_id  :integer          not null
#  group_id :integer          not null
#

require 'rails_helper'

RSpec.describe Belonging, type: :model do
  let(:belonging) { build(:belonging) }

  context 'when has a necessary parameters' do
    it { expect(belonging).to be_valid }
  end

  context 'when user_id is nil' do
    it do
      belonging.user_id = nil
      belonging.valid?
      expect(belonging.errors[:user_id]).to include('is not included in the list')
    end
  end

  context 'when user_id is not exist' do
    it do
      belonging.user_id = 0
      belonging.valid?
      expect(belonging.errors[:user_id]).to include('is not included in the list')
    end
  end

  context 'when group_id is nil' do
    it do
      belonging.group_id = nil
      belonging.valid?
      expect(belonging.errors[:group_id]).to include('is not included in the list')
    end
  end

  context 'when group_id is not exist' do
    it do
      belonging.group_id = 0
      belonging.valid?
      expect(belonging.errors[:group_id]).to include('is not included in the list')
    end
  end
end
