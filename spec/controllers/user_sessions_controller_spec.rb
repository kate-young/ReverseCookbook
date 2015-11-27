require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the new template" do
       get :new
       expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
     context "with correct credentials" do

	let!(:user) { create(:user) }

	def post_user_session
	   post :create, email: user.email, password: user.password
	end

	it "redirects to the recipes path" do
           post_user_session
	   expect(response).to be_redirect
	   expect(response).to redirect_to(recipes_path)	
	end

	it "finds the user" do
	   expect(User).to receive(:find_by).with({email: user.email}).and_return(user)
           post_user_session
	end

	it "authenticates the user" do
           User.stub(:find_by).and_return(user)
	   expect(user).to receive(:authenticate)
           post_user_session
	end

     end
  end

end
