require 'rails_helper'

RSpec.describe "admin/mona_articles/new", type: :view do
  before(:each) do
    assign(:admin_mona_article, MonaArticle.new())
  end

  it "renders new admin_mona_article form" do
    render

    assert_select "form[action=?][method=?]", mona_articles_path, "post" do
    end
  end
end
