require 'spec_helper'

describe PostsController, :type => :controller do
  describe Finder do
  
    it "should initialize class variable with  model's object  if params have 'id'" do
      post = stub_model(Post, :id => 5)
      Post.stub(:find_by_id).with("5").and_return { post }
      get :show, :id => 5

      assigns(:post).should eq(post)
    end
    
    it "should return nil for variable if object not finde" do    
      get :show, :id => 1

      assigns(:post).should eq(nil)
    end
 
  end
end

describe CommentsController, :type => :controller do
  describe Finder do
 
    it "should initialize class variable with  model's object and with  associated model's object  if params have 'id' and '*_id'" do
      post = stub_model(Post, :id => 5)
      comment = stub_model(Comment, :id => 10)
      Post.stub(:find_by_id).with("5").and_return { post }
      Comment.stub(:find_by_id).with("10").and_return { comment }
      get :show, :id => 10, :post_id => 5

      assigns(:post).should eq(post)
      assigns(:comment).should eq(comment)
    end

    it "should return nil for variable if object not finde" do    
      get :show, :id => 1, :post_id => 1

      assigns(:post).should eq(nil)
      assigns(:comment).should eq(nil)
    end

  end
end