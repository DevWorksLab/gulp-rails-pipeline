require 'rails_helper'

RSpec.describe "admin/mona_articles/index", type: :view do
  before(:each) do
    assign(:mona_articles, [
      MonaArticle.create!(),
      MonaArticle.create!()
    ])
  end

  it "renders a list of admin/mona_articles" do
    render
  end
end
