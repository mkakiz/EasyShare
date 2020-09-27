require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /homes" do
    it "responds successfully" do
      get "/"
      get "/about"
      expect(response).to have_http_status(200)
    end
  end
end
