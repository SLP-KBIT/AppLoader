class TopController < ApplicationController
  def index
    @dl_games = Game.dl_top
    @new_games = Game.new_top
  end
end
