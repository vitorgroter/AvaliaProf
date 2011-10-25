require 'spec_helper'

describe SubcommentsController do
  render_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
      @subject = Factory(:subject)
    end

    describe "failure" do

      before(:each) do
        @attr = { :comment => "", :subject_id => @subject.id }
      end

      it "should not create a subcomment" do
        lambda do
          post :create, :subcomment => @attr
        end.should_not change(Subcomment, :count)
      end

      it "should render the home page" do
        post :create, :subcomment => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :comment => "Lorem Ipsum", :subject_id => @subject.id }
      end

      it "should create a subcomment" do
        lambda do
          post :create, :subcomment => @attr
        end.should change(Subcomment, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :subcomment => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :subcomment => @attr
        flash[:success].should =~ /comment created/i
      end
    end
  end
end

