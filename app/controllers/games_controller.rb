class GamesController < ApplicationController
  before_action :current_user

  def index
  end

  def new
    @game = Game.new
    @groups = current_user.groups
  end

  def edit
  end

  def show
  end
end
