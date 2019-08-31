require 'rails_helper'

RSpec.describe PersonalDataController, type: :controller do
  describe "POST #create" do
    it "redirects to the #new action" do
      post :create, params: attributes_for(:personal_data)
      expect(response).to redirect_to action: :new
    end
  end
end
