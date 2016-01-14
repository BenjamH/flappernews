require 'rails_helper'

describe PostsController do
  let(:post) { Post.create(title: 'Viral Video', link: 'www.youtube.com')}

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

    it "add post to post model" do
      expect{
        post :create, title: "cool video", link: 'www.google.com'
        }.to change{Post.count}.by(1)
      end

  # context "user upvotes a post" do
    it "adds upvote to post model" do
      expect(post.upvotes).to eq 0
      put :upvote, id: post.id, upvotes: post.upvotes
      expect(post.reload.upvotes).to eq 1
    end

end