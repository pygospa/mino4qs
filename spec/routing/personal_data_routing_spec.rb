require "rails_helper"

RSpec.describe "Routes for PersonalData", type: :routing do
  it "routes /personaldata to personal data controller" do
    expect(get("/personaldata")).to route_to("personaldata#index")
  end
end

