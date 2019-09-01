require 'rails_helper'

RSpec.describe 'personal_data_sets/index.haml', type: :view do
  context 'when no PersonalDataSet is recorded' do
    it 'displays text saying PersonalDataSet is missing' do
      expect(render).to have_text "No personal data has been saved yet"
    end

    it 'displays a link to the new_personal_data_set' do
      expect(render).to have_link 'Add personal data', href: new_personal_data_set_path
    end
  end
end
