require 'rails_helper'

RSpec.describe PersonalDataController, type: :controller do

  describe "GET #index" do
    it "with no PersonalData recorded renders personal_data/index" do
      expect(PersonalData).to receive(:count).and_return(0)

      get :index

      expect(response).to render_template :index
    end

    it "with PersonalData recorded redirects to personal_data#show" do
      personal_data = double("PersonalData")
      expect(personal_data).to receive(:id).and_return(1)
      expect(PersonalData).to receive(:count).and_return(1).twice
      expect(PersonalData).to receive(:first).and_return(personal_data)

      get :index

      expect(response).to redirect_to action: :show, id: 1
    end
  end

  describe "GET #show" do
    it "assigns requested PersonalData object to @personal_data" do
      personal_data = double("PersonalData", id: 1, bithday: '1984-03-10',
                             height: '168', gender: 'male')
      expect(PersonalData).to receive(:find).with('1').and_return(personal_data)

      get :show, params: {id: 1}

      expect(assigns(:personal_data)).to eq(personal_data)
    end
  end

  describe "GET #new" do
    it "assings new PersonalData instance to @personal_data" do
      get :new

      expect(assigns(:personal_data)).to be_a(PersonalData)
      expect(:personal_data.birthday).to eq(nil)
      expect(:personal_data.gender).to eq(nil)
      expect(:personal_data.height).to eq(nil)
      expect(:personal_data.id).to eq(nil)
    end
  end

  describe "POST #create" do
    it "redirects to #new action" do
      post :create, params: attributes_for(:personal_data)
      expect(response).to redirect_to action: :new
    end

    it "safes a new set of PersonalData to the DB" do
      expect(post :create, params: attributes_for(:personal_data))
        .to change(PersonalData, :count).by(1)
    end
  end

end
