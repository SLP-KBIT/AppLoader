# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  icon       :string(255)      not null
#  group_id   :integer          not null
#  summary    :text             not null
#  version    :string(255)      not null
#  game_file  :string(255)      not null
#  dl_count   :integer          default(0), not null
#  movie      :string(255)
#  format     :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Game, :type => :model do
  let(:group) { Group.create(name: "group1", summary: "hoge") }
  let(:game) { group.games.build(title: "Title1", icon: "icon.png", summary: "hoge", version: "1.0", game_file: "game1.exe", format: "DOWNLOAD") }

  describe "is valid" do
    context "when has a title, icon, group_id, summary, version, game_file, dl_count and format" do
      it { expect(game).to be_valid }
    end
  end

  describe "is invalid" do
    context "when doesn't has a title" do
      it do
        game.title = nil
        game.valid?
        expect(game.errors[:title]).to include("can't be blank")
      end
    end

    context "when doesn't has a icon" do
      it do
        game.icon = nil
        game.valid?
        expect(game.errors[:icon]).to include("can't be blank")
      end
    end

    context "when doesn't has a group_id" do
      it  do
        game.group_id = nil
        game.valid?
        expect(game.errors[:group_id]).to include("can't be blank")
      end
    end

    context "when doesn't has a summary" do
      it  do
        game.summary = nil
        game.valid?
        expect(game.errors[:summary]).to include("can't be blank")
      end
    end

    context "when doesn't has a version" do
      it  do
        game.version = nil
        game.valid?
        expect(game.errors[:version]).to include("can't be blank")
      end
    end

    context "when doesn't has a game_file" do
      it  do
        game.game_file = nil
        game.valid?
        expect(game.errors[:game_file]).to include("can't be blank")
      end
    end

    context "when doesn't has a dl_count" do
      it "is invalid without a dl_count" do
        game.dl_count = nil
        game.valid?
        expect(game.errors[:dl_count]).to include("can't be blank")
      end
    end

    context "when doesn't has a format" do
      it do
        game.format = nil
        game.valid?
        expect(game.errors[:format]).to include("can't be blank")
      end
    end

    context "when has a duplicate title" do
      it  do
        game.save
        duplicate_game = group.games.build(title: "Title1")
        duplicate_game.valid?
        expect(duplicate_game.errors[:title]).to include("has already been taken")
      end
    end

    context "when group_id doesn't included in Group" do
      it do
        game = Game.new(group_id: nil)
        game.valid?
        expect(game.errors[:group_id]).to include("is not included in the list")
      end
    end
  end

  it "returns #{Game::DL_TOP} games sorted by dl_count " do
    games = []
    group = Group.create(name: 'Group1', summary: 'hoge')
    Game::DL_TOP.times do |i|
      game = group.games.create(title: "TestGame#{i}", summary: 'hoge', icon: 'hoge', version: '1.0', game_file: "file#{i}.exe", format: 'download', dl_count: Game::DL_TOP-i+1)
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
