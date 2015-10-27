require 'rails_helper'

describe ApplicationController do
  controller do
    def index
      render text: 'Sample Controller'
    end
  end

  describe '#current_user' do
    before { @user = create(:user) }
    context 'when login' do
      pending '__test__'
    end

    context 'when not login' do
      pending '__test__'
    end
  end
end
