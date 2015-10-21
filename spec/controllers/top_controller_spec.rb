require 'rails_helper'

RSpec.describe TopController, type: :controller do
  describe "GET '/index'" do
    it 'should render a index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'should load a popular Games' do
      get :index
      expect(assigns[:dl_games]).to eq Game.dl_top
    end

    it 'should load a recent Games' do
      get :index
      expect(assigns[:new_games]).to eq Game.new_top
    end
  end
end
