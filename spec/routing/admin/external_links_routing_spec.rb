require "rails_helper"

RSpec.describe Admin::ExternalLinksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/external_links").to route_to("admin/external_links#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/external_links/new").to route_to("admin/external_links#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/external_links/1").to route_to("admin/external_links#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/external_links/1/edit").to route_to("admin/external_links#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/external_links").to route_to("admin/external_links#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/external_links/1").to route_to("admin/external_links#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/external_links/1").to route_to("admin/external_links#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/external_links/1").to route_to("admin/external_links#destroy", :id => "1")
    end

  end
end
