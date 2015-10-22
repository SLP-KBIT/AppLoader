# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  icon       :string           not null
#  group_id   :integer          not null
#  summary    :text             not null
#  version    :string           not null
#  game_file  :string           not null
#  dl_count   :integer          default(0), not null
#  movie      :string
#  format     :string           not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { build(:game) }
  let(:games) { create_list(:games, 10) }

  context 'when has necessary parameters' do
    it { expect(game).to be_valid }
  end

  context 'when title is nil' do
    it do
      game.title = nil
      game.valid?
      expect(game.errors[:title]).to include("can't be blank")
    end
  end

  context 'when icon is nil' do
    it do
      game.icon = nil
      game.valid?
      expect(game.errors[:icon]).to include("can't be blank")
    end
  end

  context 'when group is nil' do
    it do
      game.group_id = nil
      game.valid?
      expect(game.errors[:group_id]).to include("can't be blank")
    end
  end

  context 'when summary is nil' do
    it do
      game.summary = nil
      game.valid?
      expect(game.errors[:summary]).to include("can't be blank")
    end
  end

  context 'when version is nil' do
    it do
      game.version = nil
      game.valid?
      expect(game.errors[:version]).to include("can't be blank")
    end
  end

  context 'when game_file is nil' do
    it do
      game.game_file = nil
      game.valid?
      expect(game.errors[:game_file]).to include("can't be blank")
    end
  end

  context 'when dl_count is nil' do
    it do
      game.dl_count = nil
      game.valid?
      expect(game.errors[:dl_count]).to include("can't be blank")
    end
  end

  context 'when format is nil' do
    it do
      game.format = nil
      game.valid?
      expect(game.errors[:format]).to include("can't be blank")
    end
  end

  context 'when has a duplicate title' do
    it do
      game.save
      duplicate_game = Game.new(title: game.title)
      duplicate_game.valid?
      expect(duplicate_game.errors[:title]).to include('has already been taken')
    end
  end

  context "when group_id doesn't included in Group" do
    it do
      game = Game.new(group_id: -1)
      game.valid?
      expect(game.errors[:group_id]).to include('is not included in the list')
    end
  end

  describe '#dl_top' do
    it "returns #{Game::DL_TOP} games sorted by dl_count " do
      games.sort! { |a, b| (b.dl_count <=> a.dl_count).nonzero? || (a.title <=> b.title) }
      expect(Game.dl_top).to eq games.first(Game::DL_TOP)
    end
  end

  describe '#new_top' do
    it "returns #{Game::NEW_TOP} games sotred by update_date" do
      games.sort! { |a, b| (b.updated_at <=> a.updated_at) || (a.title <=> b.title) }
      expect(Game.new_top).to eq games.first(Game::NEW_TOP)
    end
  end
end
