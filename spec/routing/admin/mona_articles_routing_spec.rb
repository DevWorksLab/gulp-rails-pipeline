require "rails_helper"

RSpec.describe Admin::MonaArticlesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/mona_articles").to route_to("admin/mona_articles#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/mona_articles/new").to route_to("admin/mona_articles#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/mona_articles/1").to route_to("admin/mona_articles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/mona_articles/1/edit").to route_to("admin/mona_articles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/mona_articles").to route_to("admin/mona_articles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/mona_articles/1").to route_to("admin/mona_articles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/mona_articles/1").to route_to("admin/mona_articles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/mona_articles/1").to route_to("admin/mona_articles#destroy", :id => "1")
    end

  end
end
