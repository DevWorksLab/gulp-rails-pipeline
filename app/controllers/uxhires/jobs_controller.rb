class Uxhires::JobsController < ApplicationController
  before_action :active_jobs, only: [:uxhires, :index, :refine]
  before_action :set_nested_job, only: [:job_app, :apply]

  def uxhires
    @open = @active.sample(4)
    @featured = @open.shift
  end

  def index
    @jobs = @active.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @job = Job.find(params[:id])
  end

  def job_app
    cats = CatsOne.new( options: {id: @job.catsone_id, form: true} )
    # @form = cats.get_application
    @form = {"response"=>
  {"item"=>
    {"header"=>"<p>* - indicates a required field</p>\n",
     "questions"=>
      {"question"=>
        [{"title"=>"1-2 sentences about why you're a fit for this particular role",
          "comment"=>"Please be specific.",
          "form"=>{"textarea"=>{"id"=>"field_917282", "name"=>"field_917282", "class"=>"{class}"}},
          "id"=>"917282",
          "required"=>"yes",
          "width"=>"large",
          "position"=>"0",
          "type"=>"multiline",
          "key"=>"vy23vo"},
         {"title"=>"What is motivating your search at this time?",
          "comment"=>nil,
          "form"=>
           {"textarea"=>{"id"=>"field_1017641", "name"=>"field_1017641", "class"=>"{class}"}},
          "id"=>"1017641",
          "required"=>"yes",
          "width"=>"medium",
          "position"=>"1",
          "type"=>"multiline",
          "key"=>"199mpu4"},
         {"title"=>"What's one of the coolest things about you?",
          "comment"=>"We're curious :)",
          "form"=>
           {"input"=>
             {"type"=>"text", "id"=>"field_1105371", "name"=>"field_1105371", "class"=>"{class}"}},
          "id"=>"1105371",
          "required"=>"no",
          "width"=>"medium",
          "position"=>"2",
          "type"=>"text",
          "key"=>"9n9i0p"},
         {"title"=>"Web Site",
          "comment"=>nil,
          "form"=>
           {"input"=>
             {"type"=>"text", "id"=>"field_999029", "name"=>"field_999029", "class"=>"{class}"}},
          "id"=>"999029",
          "required"=>"no",
          "width"=>"large",
          "position"=>"3",
          "type"=>"text",
          "key"=>"rpwtyo"},
         {"title"=>"Portfolio",
          "comment"=>"If you don't have a website",
          "form"=>
           {"input"=>
             {"type"=>"file", "id"=>"field_999032", "name"=>"field_999032", "class"=>"{class}"}},
          "id"=>"999032",
          "required"=>"no",
          "width"=>"medium",
          "position"=>"4",
          "type"=>"file",
          "key"=>"dqys5f"},
         {"title"=>"Upload Resume",
          "comment"=>nil,
          "form"=>
           {"input"=>
             {"type"=>"file", "id"=>"field_508511", "name"=>"field_508511", "class"=>"{class}"}},
          "id"=>"508511",
          "required"=>"yes",
          "width"=>"medium",
          "position"=>"5",
          "type"=>"file",
          "key"=>"1w3xlph"},
         {"title"=>"LinkedIn",
          "comment"=>nil,
          "form"=>
           {"input"=>
             {"type"=>"text", "id"=>"field_1017638", "name"=>"field_1017638", "class"=>"{class}"}},
          "id"=>"1017638",
          "required"=>"no",
          "width"=>"medium",
          "position"=>"6",
          "type"=>"text",
          "key"=>"aatq1r"},
         {"title"=>"First Name",
          "comment"=>nil,
          "form"=>
           {"input"=>
             {"type"=>"text", "id"=>"field_508513", "name"=>"field_508513", "class"=>"{class}"}},
          "id"=>"508513",
          "required"=>"yes",
          "width"=>"medium",
          "position"=>"7",
          "type"=>"text",
          "key"=>"2a8laqc"},
         {"title"=>"Last Name",
          "comment"=>nil,
          "form"=>
           {"input"=>
             {"type"=>"text", "id"=>"field_508515", "name"=>"field_508515", "class"=>"{class}"}},
          "id"=>"508515",
          "required"=>"yes",
          "width"=>"medium",
          "position"=>"8",
          "type"=>"text",
          "key"=>"mud38n"},
         {"title"=>"Phone",
          "comment"=>nil,
          "form"=>
           {"input"=>
             {"type"=>"text", "id"=>"field_508527", "name"=>"field_508527", "class"=>"{class}"}},
          "id"=>"508527",
          "required"=>"yes",
          "width"=>"medium",
          "position"=>"9",
          "type"=>"text",
          "key"=>"143d43t"},
         {"title"=>"Email",
          "comment"=>nil,
          "form"=>
           {"input"=>
             {"type"=>"text", "id"=>"field_508517", "name"=>"field_508517", "class"=>"{class}"}},
          "id"=>"508517",
          "required"=>"yes",
          "width"=>"large",
          "position"=>"10",
          "type"=>"text",
          "key"=>"wqgtpk"},
         {"title"=>"City",
          "comment"=>nil,
          "form"=>
           {"input"=>
             {"type"=>"text", "id"=>"field_508521", "name"=>"field_508521", "class"=>"{class}"}},
          "id"=>"508521",
          "required"=>"no",
          "width"=>"medium",
          "position"=>"11",
          "type"=>"text",
          "key"=>"1bjxrhu"},
         {"title"=>"State",
          "comment"=>nil,
          "form"=>
           {"input"=>
             {"type"=>"text", "id"=>"field_508523", "name"=>"field_508523", "class"=>"{class}"}},
          "id"=>"508523",
          "required"=>"no",
          "width"=>"medium",
          "position"=>"12",
          "type"=>"text",
          "key"=>"1sfmegm"}]},
     "name"=>"General Application",
     "updated"=>"2012-12-10"},
   "success"=>"true",
   "num_results"=>"1"}}
  end

  def apply
    binding.pry
    params[:application].merge("id" => @job.catsone_id)
    cats = CatsOne.new(options: params[:application])
    response = cats.apply_joborder
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
