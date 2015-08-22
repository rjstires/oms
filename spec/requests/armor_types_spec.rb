require 'rails_helper'

RSpec.describe "ArmorTypes", type: :request do
  describe "GET /armor_types" do
    it "works! (now write some real specs)" do
      get armor_types_path
      expect(response).to have_http_status(200)
    end
  end
end
