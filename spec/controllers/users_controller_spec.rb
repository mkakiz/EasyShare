require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it 'response code is 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'to render new template' do
      expect(response).to render_template :new
    end

    it 'new user object is passed to view file' do
      expect(assigns(:user)).to be_a_new User
    end
  end

end


