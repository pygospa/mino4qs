require 'rails_helper'

RSpec.describe PersonalDataController, type: :controller do

  describe "GET #index" do
    context "with no personal data recorded" do
      it "renders the :index page" do
        expect(PersonalData).to receive(:count).and_return(0)
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
