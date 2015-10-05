require 'rails_helper'

RSpec.describe TopController, type: :controller do
  describe "GET '/index'" do
    before { @games = create_list(:games, 10) }

    it 'should render a index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'should load a popular Games' do
      get :index
      expect(assigns[:dl_games]).to eq @games.sort_by(&:dl_count).reverse.first(Game::DL_TOP)
    end

    it 'should load a recent Games' do
      get :index
      expect(assigns[:new_games]).to eq @games.sort_by(&:updated_at).reverse.first(Game::NEW_TOP)
    end
  end
end
