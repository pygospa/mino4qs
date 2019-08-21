require "rails_helper"

RSpec.describe "Routes for PersonalData", type: :routing do
  it "routes /personaldata to personal data controller" do
    expect(get("/personaldata/new")).to route_to("personal_data#new")
  end
end

