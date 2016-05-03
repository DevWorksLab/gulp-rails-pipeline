class JobFilter

  def initialize(params: nil)
    @params = params
    @moms = Job.active
  end

  def filter_result
    filter_by_location
    # filter_by_job
    filter_by_role
    filter_by_company_type
    filter_by_description
    # @moms = @moms("years_experience BETWEEN (?) AND (?)", )
  end

  def filter_by_location
    unless @params[:location].blank?
      @moms = @moms.where("location LIKE ?", @params[:location] )
    end
    return @moms
  end

  def filter_by_role
    unless @params[:role].blank?
      @moms = @moms.where("title LIKE ?", @params[:role] )
    end
    return @moms
  end

  def filter_by_company_type
    unless @params[:company_type].blank?
      @moms = @moms.where("company_type LIKE ?", @params[:company_type] )
    end
    return @moms
  end

  def filter_by_description
    unless @params[:keywords].blank?
      @moms = @moms.where("description LIKE ?", @params[:keywords] )
    end
    return @moms
  end

end
