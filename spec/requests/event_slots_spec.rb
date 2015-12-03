require 'rails_helper'

RSpec.describe "EventSlots", type: :request do
  describe "GET /event_slots" do
    it "works! (now write some real specs)" do
      get event_slots_path
      expect(response).to have_http_status(200)
    end
  end
end
