require 'rails_helper'

RSpec.describe "Likes", type: :request do
  before do
    post login_path, params: {
      email: user02.email,
      password: user02.password,
    }
    get posts_index_path
    expect(response).to have_http_status(:ok)
    expect {
      post posts_create_path, params: {
        content: 'text',
        user_id: user02.id,
      }
    }.to change(Post, :count).by(1)
  end

  describe "Like Create" do
    let(:user02) { FactoryBot.create(:user02) }
    it "adds like" do
      post = Post.find_by(content: 'text')
      like = Like.new(user_id: user02.id, post_id: post.id)
      like.save
      expect {
        post "/likes/post_id/create"
      }.to change(Like, :count).by(1)
    end
  end

  describe "Like Delete" do
    let(:user02) { FactoryBot.create(:user02) }
    it "substracts Like" do
      post = Post.find_by(content: 'text')
      like = Like.new(user_id: user02.id, post_id: post.id)
      like.save
      post "/likes/post_id/create"
      expect {
        post "/likes/post_id/destroy"
      }.to change(Like, :count).by(-1)
    end
  end

end
