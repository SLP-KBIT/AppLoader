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
  it "is valid with a title, icon, group_id, summary, version, game_file, dl_count, format" do
    group = Group.create(name: "group1", summary: "hoge")
    game = group.games.build(title: "Title1", icon: "icon.png", summary: "hoge", version: "1.0", game_file: "game1.exe", format: "DOWNLOAD")
    expect(game).to be_valid
  end

  it "is invalid without a title" do
    game = Game.new(title: nil)
    game.valid?
    expect(game.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a icon" do
    game = Game.new(icon: nil)
    game.valid?
    expect(game.errors[:icon]).to include("can't be blank")
  end

  it "is invalid without a group_id" do
    game = Game.new(group_id: nil)
    game.valid?
    expect(game.errors[:group_id]).to include("can't be blank")
  end

  it "is invalid without a summary" do
    game = Game.new(summary: nil)
    game.valid?
    expect(game.errors[:summary]).to include("can't be blank")
  end

  it "is invalid without a version" do
    game = Game.new(version: nil)
    game.valid?
    expect(game.errors[:version]).to include("can't be blank")
  end

  it "is invalid without a game_file" do
    game = Game.new(game_file: nil)
    game.valid?
    expect(game.errors[:game_file]).to include("can't be blank")
  end

  it "is invalid without a dl_count" do
    game = Game.new(dl_count: nil)
    game.valid?
    expect(game.errors[:dl_count]).to include("can't be blank")
  end

  it "is invalid without a format" do
    game = Game.new(format: nil)
    game.valid?
    expect(game.errors[:format]).to include("can't be blank")
  end

  it "does not allow duplicate title" do
    group = Group.create(name: 'Group1', summary: 'hoge')
    game1 = group.games.create(title: 'TestGame', summary: 'hoge', icon: 'hoge', version: '1.0', game_file: 'file1.exe', format: 'download')
    game1.valid?
    expect(game1.errors).to be_blank
    game2 = group.games.build(title: 'TestGame')
    game2.valid?
    expect(game2.errors[:title]).to include("has already been taken")
  end

  it "is invalid without a included group_id in Group" do
    game = Game.new(group_id: nil)
    game.valid?
    expect(game.errors[:group_id]).to include("is not included in the list")
  end
end
