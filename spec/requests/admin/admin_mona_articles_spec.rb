require 'rails_helper'

RSpec.describe "Admin::MonaArticles", type: :request do
  describe "GET /admin_mona_articles" do
    it "works! (now write some real specs)" do
      get admin_mona_articles_index_path
      expect(response).to have_http_status(200)
    end
  end
end
