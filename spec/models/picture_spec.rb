# == Schema Information
#
# Table name: pictures
#
#  id           :integer          not null, primary key
#  game_id      :integer          not null
#  picture_file :string           not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Picture, type: :model do
  let(:picture) { build(:picture) }

  context 'when has necessary parameters' do
    it { expect(picture).to be_valid }
  end

  context 'when game_id is nil' do
    it do
      picture.game_id = nil
      picture.valid?
      expect(picture.errors[:game_id]).to include("can't be blank")
    end
  end

  context 'when picture_file is nil' do
    it do
      picture.picture_file = nil
      picture.valid?
      expect(picture.errors[:picture_file]).to include("can't be blank")
    end
  end

  context 'when has aduplicate picture_file' do
    it do
      picture.save
      duplicate_picture = Picture.new(picture_file: picture.picture_file)
      duplicate_picture.valid?
      expect(duplicate_picture.errors[:picture_file]).to include('has already been taken')
    end
  end

  context 'when picture_file is invalid format' do
    it do
      picture.picture_file = 'hoge.exe'
      picture.valid?
      expect(picture.errors[:picture_file]).to include('is invalid')
    end
  end
end
