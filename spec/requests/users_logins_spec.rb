require 'rails_helper'

RSpec.describe "SignUp & Logins", type: :request do
  describe "Pages by LoggedIn User" do
    let(:user) { FactoryBot.create(:user) }
    it "responds successfully" do
      post login_path, params: {
        email: user.email,
        password: user.password,
      }
      expect(user).to be_valid
      expect(response).to redirect_to "/posts/index"
      get posts_index_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "Login Failure without password" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post login_path, params: {
        email: user02.email,
        password: '',
      }
      expect(user02).to be_valid
      get "/login"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "Login Failure without email" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post login_path, params: {
        email: '',
        password: user02.password,
      }
      expect(user02).to be_valid
      get "/login"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "Unsuccessful Edit" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post login_path, params: {
        email: user02.email,
        password: user02.password,
      }
      get "/users/#{user02.id}/edit"
      post "/users/#{user02.id}/update", params: {
                            email: "fake@invalid",
                            password: "",
                          }
      get "/users/#{user02.id}/edit"
      expect(response).to have_http_status "200"
    end
  end

  describe "Successful Edit" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post login_path, params: {
        email: user02.email,
        password: user02.password,
      }
      get "/users/#{user02.id}/edit"
      post "/users/#{user02.id}/update", params: {
                            name:  "updating",
                            email: "updating@example.com",
                          }
      editted_user = User.find(user02.id)
      expect(user02.name).not_to eq editted_user.name
    end
  end

end
