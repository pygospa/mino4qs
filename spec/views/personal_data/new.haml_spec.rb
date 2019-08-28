require 'rails_helper'

RSpec.describe 'personal_data/new.haml', type: :view do
  it 'displays from for personal data' do
    render
    expect(rendered).to have_css("form.personal-data")
  end

  context 'form' do
    it 'contains field for birthday' do
      render
      expect(rendered).to have_field("birthday")
    end

    it 'contains a field for gender' do
      render
      expect(render).to have_field("gender")
    end
  end
end

