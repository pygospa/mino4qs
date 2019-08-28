require 'rails_helper'

RSpec.describe 'personal_data/new.haml', type: :view do
  it 'displays a from to add personal data' do
    render
    expect(rendered).to have_css("form.personal-data")
  end

  it 'form contains a field to add birthday' do
    render
    expect(rendered).to have_field("birthday")
  end

  it 'form contains a field to add gender' do
    render
    expect(render).to have_field("gender")
  end
end

