# service wrappper for CatsOne Api calls
class CatsOne
  include HTTParty
  require 'json'
  require 'open-uri'
  base_uri 'https://uxhires.catsone.com/api'

  def initialize(options: nil)
    # @headers = {"Authorization" => 'Token ' + ENV['UXHIRES_CATSONE_TOKEN'], "Content-Type" => "application/json", "Accept" => "application/json"}
    @options = options
    @options[:transaction_code] = ENV['UXHIRES_CATSONE_TOKEN']
  end

  # Parse through JSON jobs array from get_jobs
  def parse_jobs(array)
    array.each do |jobs|
      jobs.each do |job|
        catsone_id = job["item_id"]
        company = job["company"]
        title = job["title"]
        status =  job["status"].split(' (').first.downcase
        # description = job["description"]
        location = job["location"]
        hotness = job["is_hot"]  == "No" ? false : true
        # Do we need company and if so we need another call to get the name
        # lets try to limit calls by storing companies in DB

        # Check if job is in DB
        if job = Job.find_by_catsone_id(catsone_id)
          # update
          job.update(
            title: title,
            catsone_id: catsone_id,
            status: status,
            # description: description, in V2 api description is seperate call
            company_name: company,
            status: status,
            location: location,
            is_hot: hotness
            )
        else
          # Add Job To DB
          Job.create(
            title: title,
            catsone_id: catsone_id,
            status: status,
            # description: description, in V2 api description is seperate call
            company_name: company,
            status: status,
            location: location,
            is_hot: hotness
            )
        end
      end
    end
  end

  def get_jobs
    jobs_arr = []
    response = self.class.get("/get_joborders", query: @options)
    last_page = response["response"]["num_pages"].to_i
    jobs_arr.push(response["response"]["item"])
    i = 1
    while i < last_page
      @options[:page_number] = 0 + i
      response = self.class.get("/get_joborders", query: @options)
      jobs_arr.push(response["response"]["item"])
      i += 1
    end
    parse_jobs(jobs_arr)
  end

  def apply
    response = self.class.post('/apply_joborder', query: @options )
  end

  def get_job_descriptions
    response = self.class.get("/get_joborder", query: @options)
    jobs = response["response"]["result"]
    jobs.each do |job|
      record = Job.find_by_catsone_id(job["id"])
      role = job["extra_field196083"]
      company_type = job["extra_field196089"]
      description = job["description"]
      public = job["public"]
      status = job["status"]
      record.update(
        status: status, description: description, public: public,
        company_type: company_type, role: role
        )
    end
  end

  # Call to get custom app form for each joborder
  def get_application
    # doc = Nokogiri::HTML(open("https://uxhires.catsone.com/api/get_joborder_applications?transaction_code=#{@options[:transaction_code]}&id=#{@options[:id]}&form=true"))
    response = self.class.get('/get_joborder_applications', query: @options )
  end

  # def users
  #   self.class.get("/2.2/users", @options)
  # end
end
