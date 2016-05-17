require 'rails_helper'

RSpec.describe "admin/external_links/index", type: :view do
  before(:each) do
    assign(:external_links, [
      ExternalLink.create!(
        :link_type => "Link Type",
        :title => "Title",
        :url => "Url"
      ),
      ExternalLink.create!(
        :link_type => "Link Type",
        :title => "Title",
        :url => "Url"
      )
    ])
  end

  it "renders a list of admin/external_links" do
    render
    assert_select "tr>td", :text => "Link Type".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
