class TopController < ApplicationController
  def index
    @games = Game.all
  end
end
