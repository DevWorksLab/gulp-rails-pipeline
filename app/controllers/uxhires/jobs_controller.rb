class Uxhires::JobsController < ApplicationController

  def uxhires

  end

  def index
    @jobs = Job.active.paginate(:page => params[:page], :per_page => 5)
  end

  def show

  end

  def job_app

  end

end
