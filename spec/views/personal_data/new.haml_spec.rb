require "rails_helper"

RSpec.describe "personal_data/new.haml" do
  it "displays a form to add personal data" do
    render
    expect(rendered).to have_css("form.personal-data")
  end
end
