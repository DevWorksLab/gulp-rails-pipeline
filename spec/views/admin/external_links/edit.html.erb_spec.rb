require 'rails_helper'

RSpec.describe "admin/external_links/edit", type: :view do
  before(:each) do
    @admin_external_link = assign(:admin_external_link, ExternalLink.create!(
      :link_type => "MyString",
      :title => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit admin_external_link form" do
    render

    assert_select "form[action=?][method=?]", admin_external_link_path(@admin_external_link), "post" do

      assert_select "input#admin_external_link_link_type[name=?]", "admin_external_link[link_type]"

      assert_select "input#admin_external_link_title[name=?]", "admin_external_link[title]"

      assert_select "input#admin_external_link_url[name=?]", "admin_external_link[url]"
    end
  end
end
