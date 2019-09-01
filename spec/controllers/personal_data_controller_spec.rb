require 'rails_helper'

RSpec.describe PersonalDataController, type: :controller do

  describe "GET #index" do
    it "with no personal data recorded renders personal_data/index" do
      expect(PersonalData).to receive(:count).and_return(0)

      get :index

      expect(response).to render_template :index
    end

    it "with personal data recorded renders personal_data/show" do
      personal_data = double("PersonalData")
      expect(personal_data).to receive(:id).and_return(1)
      expect(PersonalData).to receive(:count).and_return(1).twice
      expect(PersonalData).to receive(:first).and_return(personal_data)

      get :index

      expect(response).to redirect_to action: :show, id: 1
    end
  end

  describe "GET #show" do
    it "renders personal_data/show" do
      personal_data = double("PersonalData", id: 1, bithday: '1984-03-10',
                             height: '168', gender: 'male')
      expect(PersonalData).to receive(:find).with('1').and_return(personal_data)

      get :show, params: {id: 1}

      expect(response).to render_template :show
    end

    it "assigns the requested personal data to @personal_data" do
      personal_data = double("PersonalData", id: 1, bithday: '1984-03-10',
                             height: '168', gender: 'male')
      expect(PersonalData).to receive(:find).with('1').and_return(personal_data)

      get :show, params: {id: 1}

      expect(assigns(:personal_data)).to eq(personal_data)
    end
  end

  describe "POST #create" do
    it "redirects to the #new action" do
      post :create, params: attributes_for(:personal_data)
      expect(response).to redirect_to action: :new
    end

    it "creates a new set of personal_data" do
      expect(post :create, params: attributes_for(:personal_data))
        .to change(PersonalData, :count).by(1)
    end
  end

end
