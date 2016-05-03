class Uxhires::JobsController < ApplicationController
  before_action :active_jobs, only: [:index, :refine]

  def uxhires

  end

  def index
    @jobs = @active.paginate(:page => params[:page], :per_page => 5)
  end

  def show

  end

  def job_app

  end

  def refine
    filter = JobFilter.new(params: params[:search])
    @jobs = filter.filter_result.paginate(:page => params[:page], :per_page => 5)
    render :index
  end

  private

    def active_jobs
      @active = Job.active
    end

end
