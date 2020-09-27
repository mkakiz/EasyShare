require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    post login_path, params: {
      email: user02.email,
      password: user02.password,
    }
    get posts_index_path
    post posts_create_path, params: {
          content: 'text',
          user_id: user02.id,
    }
  end

  describe "Comment Post Success" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post = Post.find_by(content: 'text')
      expect {
        post comments_path, params: {
          comment: {
            comment: 'koment',
            post_id: post.id,
            address: 'tokyo',
            user_id: user02.id,
          }
        }
      }.to change(Comment, :count).by(1)
    end
  end

  describe "Comment Post Unsuccess" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post = Post.find_by(content: 'text')
      expect {
        post comments_path, params: {
          comment: {
            comment: '',
            post_id: post.id,
            address: '',
            user_id: user02.id,
          }
        }
      }.to change(Comment, :count).by(0)
    end
  end

  describe "Comment Post Delete" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post = Post.find_by(content: 'text')
      expect {
        post comments_path, params: {
          comment: {
            comment: 'koment',
            post_id: post.id,
            address: 'tokyo',
            user_id: user02.id,
          }
        }
      }.to change(Comment, :count).by(1)
      comment = Comment.find_by(comment: 'koment')
      expect {
        delete "/comments/#{comment.id}"
      }.to change(Comment, :count).by(-1)
    end
  end

end
