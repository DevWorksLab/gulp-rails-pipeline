require 'rails_helper'

RSpec.describe "admin/mona_articles/show", type: :view do
  before(:each) do
    @admin_mona_article = assign(:admin_mona_article, MonaArticle.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
