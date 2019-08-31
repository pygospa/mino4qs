require 'rails_helper'

RSpec.describe 'personal_data/index.haml', type: :view do
  context 'when no personal data recorded' do
    it 'displays text saying stating personal data is missing' do
      expect(render).to have_text "No personal data recorded yet"
    end

    it 'displays a link to the new_personal_datum_path' do
      expect(render).to have_link 'Add personal data', href: new_personal_datum_path
    end
  end
end
