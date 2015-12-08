require 'rails_helper'

RSpec.describe "CustomerContacts", type: :request do
  describe "GET /customer_contacts" do
    it "works! (now write some real specs)" do
      get customer_contacts_path
      expect(response).to have_http_status(200)
    end
  end
end
