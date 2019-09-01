require 'rails_helper'

RSpec.describe PersonalDataController, type: :controller do

  describe "GET #index" do
    it "with no personal data recorded renders the :index page" do
      expect(PersonalData).to receive(:count).and_return(0)

      get :index

      expect(response).to render_template :index
    end

    it "with personal data recorded renders the :show page" do
      personal_data = double("PersonalData")
      expect(personal_data).to receive(:id).and_return(1)
      expect(PersonalData).to receive(:count).and_return(1).twice
      expect(PersonalData).to receive(:first).and_return(personal_data)

      get :index

      expect(response).to redirect_to action: :show, id: 1
    end
  end

  describe "POST #create" do
    it "redirects to the #new action" do
      post :create, params: attributes_for(:personal_data)
      expect(response).to redirect_to action: :new
    end
  end

end
