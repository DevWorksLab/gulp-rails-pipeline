require 'rails_helper'

RSpec.describe "admin/external_links/show", type: :view do
  before(:each) do
    @admin_external_link = assign(:admin_external_link, ExternalLink.create!(
      :link_type => "Link Type",
      :title => "Title",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Link Type/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Url/)
  end
end
