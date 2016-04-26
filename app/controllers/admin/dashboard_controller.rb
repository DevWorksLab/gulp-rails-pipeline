class Admin::DashboardController < ApplicationController
  layout "admin"
  before_filter :authenticate

  def index
  end

end
