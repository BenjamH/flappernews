require 'rails_helper'

describe PostsController do
  # let(:post) { Post.create(title: 'Viral Video', link: 'www.youtube.com')}

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe "POST create" do
      post_params = FactoryGirl.attributes_for(:post)

    it "uses strong params for post" do
      should permit(:title, :link).for(:create, params: { post: post_params } ).on(:post)
    end

    it "adds post to post model" do
        expect { post :create, post: post_params }.to change(Post, :count).by(1)
    end

  end

  # context "user upvotes a post" do
    # it "adds upvote to post model" do
    #   expect(post.upvotes).to eq 0
    #   put :upvote, id: post.id, upvotes: post.upvotes
    #   expect(post.reload.upvotes).to eq 1
    # end

end