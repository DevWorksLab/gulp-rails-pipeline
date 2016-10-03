require 'rails_helper'

RSpec.describe "Admin::ExternalLinks", type: :request do
  describe "GET /admin_external_links" do
    it "works! (now write some real specs)" do
      get admin_external_links_path
      expect(response).to have_http_status(200)
    end
  end
end
