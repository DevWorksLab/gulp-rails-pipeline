class Uxhires::JobsController < ApplicationController
  before_action :active_jobs, only: [:uxhires, :index, :refine, :job_show]
  before_action :set_nested_job, only: [:job_app, :apply]

  def uxhires
    @open = @active.sample(4)
    @featured = @open.shift
  end

  def index
    @jobs = @active.paginate(:page => params[:page], :per_page => 5)

    
  end

  def job_show
    @job = Job.find(params[:id])
    @open = @active.sample(4)
    @featured = @open.shift
  end

  def job_app
    cats = CatsOne.new( options: {id: @job.catsone_id, form: true} )
    @form = cats.get_application
    # if @form["response"]["item"] && @form["response"]["item"]["name"] != "General Application"
    #   binding.pry
    # end
  end

  def apply
    params[:application].merge("id" => @job.catsone_id)
    cats = CatsOne.new(options: params[:application])
    response = cats.apply_joborder
    if response["response"]["success"] == true
      #handle success notice
    else
      #render error
    end
  end

  def refine
    filter = JobFilter.new(params: params[:search], jobs: @active)
    @jobs = filter.filter_result.paginate(:page => params[:page], :per_page => 5)

    render :index
  end

  private

    def active_jobs
      @active = Job.active
    end

    def set_nested_job
      @job = Job.find(params[:job_id])
    end

end
