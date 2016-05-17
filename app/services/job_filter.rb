class JobFilter

  def initialize(params: nil, jobs: nil)
    @params = params
    @jobs = Job.active
  end

  def filter_result
    filter_by_location
    # filter_by_job
    filter_by_role
    filter_by_company_type
    filter_by_description
    # @jobs = @jobs("years_experience BETWEEN (?) AND (?)", )
  end

  def filter_by_location
    unless @params[:location].blank?
      @jobs = @jobs.where("location LIKE ?", "%#{@params[:location]}%" )
    end
    return @jobs
  end

  def filter_by_role
    unless @params[:role].blank?
      @jobs = @jobs.where("role LIKE ?", "%#{@params[:role]}%" )
    end
    return @jobs
  end

  def filter_by_company_type
    unless @params[:company_type].blank?
      @jobs = @jobs.where("company_type LIKE ?", "%#{@params[:company_type]}%" )
    end
    return @jobs
  end

  def filter_by_description
    unless @params[:keywords].blank?
      @jobs = @jobs.where("description LIKE ?", "%#{@params[:keywords]}%" )
    end
    return @jobs
  end

end
