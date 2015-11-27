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
     it "redirects to the recipes path" do
        post :create, email: "string@string.com", password: "string"
        expect(response).to be_redirect
        expect(response).to redirect_to(recipes_path)	
     end
  end

end
