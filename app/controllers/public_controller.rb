class PublicController < ApplicationController
  layout "admin", :only => [:admin]

  def index
  end
  
end
