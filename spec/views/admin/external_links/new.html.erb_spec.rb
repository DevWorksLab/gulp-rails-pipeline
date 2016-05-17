require 'rails_helper'

RSpec.describe "admin/external_links/new", type: :view do
  before(:each) do
    assign(:admin_external_link, ExternalLink.new(
      :link_type => "MyString",
      :title => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new admin_external_link form" do
    render

    assert_select "form[action=?][method=?]", external_links_path, "post" do

      assert_select "input#admin_external_link_link_type[name=?]", "admin_external_link[link_type]"

      assert_select "input#admin_external_link_title[name=?]", "admin_external_link[title]"

      assert_select "input#admin_external_link_url[name=?]", "admin_external_link[url]"
    end
  end
end
