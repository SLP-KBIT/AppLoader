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

  def create
    tmp_param = game_params
    tmp_param['game_file'] = tmp_param['game_file'].original_filename
    tmp_param['icon'] = tmp_param['icon'].original_filename
    tmp_param['movie'] = tmp_param['movie'].original_filename
    game = Game.new(tmp_param)
    game.save
    gp = game_params
    game_upload(gp['game_file'], game)
    icon_upload(gp['icon'], game)
    movie_upload(gp['movie'], game)
    redirect_to games_path
  end

  private

  def game_upload(file = file, game = game)
    path = "#{DATA_PATH[:game]}/#{game.id}"
    link_path = LINK_PATH[:game]
    file_upload(file, game, path, link_path)
  end

  def icon_upload(file = file, game = game)
    path = "#{DATA_PATH[:icon]}/#{game.id}"
    link_path = LINK_PATH[:icon]
    file_upload(file, game, path, link_path)
  end

  def movie_upload(file = file, game = game)
    path = "#{DATA_PATH[:movie]}/#{game.id}"
    link_path = LINK_PATH[:movie]
    file_upload(file, game, path, link_path)
  end

  def file_upload(file, game, path, link_path)
    link_name = Digest::SHA1.hexdigest(game.title)
    FileUtils.mkdir_p path unless FileTest.exist? path
    File.open("#{path}/#{file.original_filename}", 'wb') { |f| f.write(file.read) }
  end

  def game_params
    params.require(:game).permit(:game_file,
                                 :title,
                                 :format,
                                 :title,
                                 :version,
                                 :icon,
                                 :group_id,
                                 :summary,
                                 :movie)
  end
end
