# -*- coding: utf-8 -*-
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
  let(:user) { build(:user) }
  context 'when has necessary parameters' do
    it do
      expect(user).to be_valid
    end
  end

  context 'when account is nil' do
    it do
      user.account = nil
      user.valid?
      expect(user.errors[:account]).to include("can't be blank")
    end
  end

  context 'when name is nil' do
    it do
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  context 'when password_digest is nil' do
    it do
      user.password_digest = nil
      user.valid?
      expect(user.errors[:password_digest]).to include("can't be blank")
    end
  end

  context 'when enable_flag is nil' do
    it do
      user.enable_flag = nil
      user.valid?
      expect(user.errors[:enable_flag]).to include('is not included in the list')
    end
  end

  context 'when admin_flag is nil' do
    it do
      user.admin_flag = nil
      user.valid?
      expect(user.errors[:admin_flag]).to include('is not included in the list')
    end
  end

  context 'when icon is nil' do
    it do
      user.icon = nil
      user.valid?
      expect(user.errors[:icon]).to include("can't be blank")
    end
  end

  context 'when has a duplicate account' do
    it do
      user.save
      duplicate_user = User.new(account: user.account)
      duplicate_user.valid?
      expect(duplicate_user.errors[:account]).to include('has already been taken')
    end
  end

  context 'when has an invalid account' do
    it do
      user.account = 'ほげ'
      user.valid?
      expect(user.errors[:account]).to include('is invalid')
    end
  end
end
