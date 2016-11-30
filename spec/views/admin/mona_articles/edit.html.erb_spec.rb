require 'rails_helper'

RSpec.describe "admin/mona_articles/edit", type: :view do
  before(:each) do
    @admin_mona_article = assign(:admin_mona_article, MonaArticle.create!())
  end

  it "renders the edit admin_mona_article form" do
    render

    assert_select "form[action=?][method=?]", admin_mona_article_path(@admin_mona_article), "post" do
    end
  end
end
