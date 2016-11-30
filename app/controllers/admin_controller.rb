class AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "admin"
  before_filter :authenticate
  before_action :set_mona_article

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "admin" && password == "motivatedevshop"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_mona_article
      @mona_article = MonaArticle.find_or_create_by(id: 1)
    end
end
