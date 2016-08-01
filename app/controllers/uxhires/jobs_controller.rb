class Uxhires::JobsController < ApplicationController
  before_action :active_jobs, only: [:uxhires, :index, :refine, :job_show, :job_app]
  before_action :set_nested_job, only: [:job_app, :apply]
  before_action :set_external_links, only: [:job_show, :job_app, :index, :refine]

  protect_from_forgery with: :null_session

  def uxhires
    @open = @active.sample(4)
    @featured = @open.shift
    @external_links = ExternalLink.take(2)
  end

  def index
    @open = @active.sample(4)
    @featured = @open.shift
    @jobs = @active.paginate(:page => params[:page], :per_page => 5)
  end

  def job_show
    @job = Job.find(params[:id])
    set_related
  end

  def job_app
    cats = CatsOne.new( options: {id: @job.catsone_id, form: true} )
    @form = cats.get_application
    set_related
    # if @form["response"]["item"] && @form["response"]["item"]["name"] != "General Application"
    #   binding.pry
    # end
  end

  def apply
    params[:application]["id"] = @job.catsone_id
    email = nil
    resume = nil
    params[:application].each do |key, field|
      if (field.class != ActionDispatch::Http::UploadedFile && !field.is_a?(Numeric) )  && field.include?("@")
        email = field
      end
    end
    params[:application]["email"] = email
    params[:application]["password"] = SecureRandom.hex(8)
    cats = CatsOne.new(options: params[:application])
    @response = cats.apply_joborder
    # @response = {"response" => {"success" => true}}
    doc = Nokogiri::XML(@response).children
    success = nil
    message = nil
    doc.each do |child|
      child.attributes.each do |attribute|
        if attribute[0] == "success" && attribute[1].value == "true"
          message = "Your application has successfully be submitted!"
          success = true
        else
          message = "There was a problem with your application"
          success = false
        end
      end
    end
    flash[:notice] = message
    if success
      redirect_to uxhires_job_show_path(@job)
    else
      render 'job_app'
    end

  end

  def refine
    filter = JobFilter.new(params: params[:search], jobs: @active)
    @jobs = filter.filter_result.paginate(:page => params[:page], :per_page => 5)
    @open = @active.sample(4)
    @featured = @open.shift

    render :index
  end

  private

    def active_jobs
      @active = Job.active
    end

    def set_nested_job
      @job = Job.find(params[:job_id])
    end

    def set_related
      @open = @active.where("location LIKE ? OR title LIKE ?", @job.location, @job.title).sample(4)
      @featured = @open.shift
    end

    def set_external_links
      @external_links = ExternalLink.take(3)
      @featured_person = Person.active.sample
    end

end
