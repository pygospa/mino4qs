require 'rails_helper'

RSpec.describe PersonalDataSetsController, type: :controller do

  let(:personal_data_set) { double("PersonalDataSet", id: 1,
                                                      birthday: '1980-02-26',
                                                      height: '185',
                                                      gender: 'male') }

  describe 'GET #index' do
    context 'with no PersonalDataSet saved to DB' do
      it 'renders index page' do
        expect(PersonalDataSet).to receive(:count).and_return(0)
        get :index
        expect(response).to render_template :index
      end
    end

    context 'with PersonalDataSet saved to DB' do
      it "redirects to PersonalDataSetsController#show" do
        expect(PersonalDataSet).to receive(:count).and_return(1)
        expect(PersonalDataSet).to receive(:first).and_return(personal_data_set)
        get :index
        expect(response).to redirect_to action: :show, id: 1
      end
    end
  end

  # TODO: assigns = bad style?
  describe "GET #show" do
    it "assigns requested PersonalDataSet object to @personal_data_set" do
     expect(PersonalDataSet).to receive(:find).with('1') \
                            .and_return(personal_data_set)
      get :show, params: {id: 1}
      expect(assigns(:personal_data_set)).to eq(personal_data_set)
    end
  end

  # TODO: assigns = bad style?
  describe "GET #new" do
    it "assings new PersonalDataSet instance to @personal_data_set" do
      get :new
      personal_data_set = @controller.instance_variable_get(:@personal_data_set)
      expect(assigns(:personal_data_set)).to be_a(PersonalDataSet)
      expect(personal_data_set.birthday).to eq(nil)
      expect(personal_data_set.gender).to eq(nil)
      expect(personal_data_set.height).to eq(nil)
      expect(personal_data_set.id).to eq(nil)
    end
  end

  describe "POST #create" do
    it "redirects to #new action" do
      post :create,
        params: { personal_data_set: attributes_for(:personal_data_set) }
      expect(response).to redirect_to action: :new
    end

    it "safes a new set of PersonalDataSet to the DB" do
      expect{ post :create,
              params: { personal_data_set: attributes_for(:personal_data_set) }
      }.to change{ PersonalDataSet.count }.by(1)
    end
  end
end

