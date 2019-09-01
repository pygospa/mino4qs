require 'rails_helper'

RSpec.describe 'personal_data_sets/new.haml', type: :view do
  it 'displays from for PersonalDataSet' do
    expect(render).to have_css("form.personal-data-set")
  end

  context 'form' do
    it 'contains field for birthday' do
      expect(render).to have_field("birthday")
    end

    it 'contains a field for gender' do
      expect(render).to have_field("gender")
    end

    it 'contains a field for height' do
      expect(render).to have_field("height")
    end

    it 'contains a button to submit form' do
      expect(render).to have_button('Submit')
    end
  end
end

