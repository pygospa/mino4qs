require 'rails_helper'

RSpec.describe PersonalDataController, type: :controller do
  describe "GET #index" do
    context "no personal data recorded" do
      it "it renders the index page" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe "POST #create" do
    it "redirects to the #new action" do
      post :create, params: attributes_for(:personal_data)
      expect(response).to redirect_to action: :new
    end
  end
end
