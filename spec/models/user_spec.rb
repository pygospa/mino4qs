require 'rails_helper'

RSpec.describe User, type: :model do
  context "factory" do
    it "creates valid objects" do
      expect(build(:user)).to be_valid
    end
  end
end
