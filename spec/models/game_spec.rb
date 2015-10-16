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
  let(:group) { create(:group) }

  context 'when has necessary parameters' do
    let(:game) { build(:game) }
    it { expect(game).to be_valid }
  end

  context 'when title is nil' do
    let(:game) { build(:game, title: nil) }
    it do
      game.valid?
      expect(game.errors[:title]).to include("can't be blank")
    end
  end

  context 'when icon is nil' do
    let(:game) { build(:game, icon: nil) }
    it do
      game.valid?
      expect(game.errors[:icon]).to include("can't be blank")
    end
  end

  context 'when group is nil' do
    let(:game) { build(:game, group_id: nil) }
    it do
      game.valid?
      expect(game.errors[:group_id]).to include("can't be blank")
    end
  end

  context 'when summary is nil' do
    let(:game) { build(:game, summary: nil) }
    it do
      game.valid?
      expect(game.errors[:summary]).to include("can't be blank")
    end
  end

  context 'when version is nil' do
    let(:game) { build(:game, version: nil) }
    it do
      game.valid?
      expect(game.errors[:version]).to include("can't be blank")
    end
  end

  context 'when game_file is nil' do
    let(:game) { build(:game, game_file: nil) }
    it do
      game.valid?
      expect(game.errors[:game_file]).to include("can't be blank")
    end
  end

  context 'when dl_count is nil' do
    let(:game) { build(:game, dl_count: nil) }
    it do
      game.valid?
      expect(game.errors[:dl_count]).to include("can't be blank")
    end
  end

  context 'when format is nil' do
    let(:game) { build(:game, format: nil) }
    it do
      game.valid?
      expect(game.errors[:format]).to include("can't be blank")
    end
  end

  context 'when has a duplicate title' do
    let(:game) { create(:game) }
    it do
      duplicate_game = Game.new(title: game.title)
      duplicate_game.valid?
      expect(duplicate_game.errors[:title]).to include('has already been taken')
    end
  end

  context "when group_id doesn't included in Group" do
    it do
      game = Game.new(group_id: nil)
      game.valid?
      expect(game.errors[:group_id]).to include('is not included in the list')
    end
  end

  it "returns #{Game::DL_TOP} games sorted by dl_count " do
    games = []
    group = Group.create(name: 'Group1', summary: 'hoge')
    Game::DL_TOP.times do |i|
      game = group.games.create(title: "TestGame#{i}",
                                summary: 'hoge',
                                icon: 'hoge',
                                version: '1.0',
                                game_file: "file#{i}.exe",
                                format: 'download',
                                dl_count: Game::DL_TOP - i + 1)
      games.push(game)
    end
    expect(Game.dl_top).to eq games
  end

  it "returns #{Game::NEW_TOP} games sotred by update_date" do
    games = []
    group = Group.create(name: 'Group1', summary: 'hoge')
    Game::NEW_TOP.times do |i|
      game = group.games.create(title: "TestGame#{i}", summary: 'hoge', icon: 'hoge', version: '1.0', game_file: "file#{i}.exe", format: 'download')
      games.push(game)
    end
    expect(Game.new_top).to eq games.reverse
  end
end
