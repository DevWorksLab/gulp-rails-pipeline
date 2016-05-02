# service wrappper for CatsOne Api calls
class CatsOne
  include HTTParty
  require 'json'
  base_uri 'https://api.catsone.com/v3'

  def initialize(options)
    @headers = {"Authorization" => 'Token ' + ENV['UXHIRES_CATSONE_TOKEN'], "Content-Type" => "application/json", "Accept" => "application/json"}
    @options = options
  end

  # Parse through JSON jobs array from get_jobs
  def parse_jobs(array)
    array.each do |jobs|
      jobs.each do |job|
        catsone_id = job["id"]
        title = job["title"]
        status =  job["_embedded"]["status"]["mapping"]
        description = job["description"]
        location = job["location"].values[0..1].join(", ")

        # Do we need company and if so we need another call to get the name
        # lets try to limit calls by storing companies in DB

        # Check if job is in DB
        if job = Job.find_by_catsone_id(catsone_id)
          # update
          job.update(
            title: title,
            catsone_id: catsone_id,
            status: status,
            description: description,
            status: status,
            location: location
            )
        else
          # Add Job To DB
          Job.create(
            title: title,
            catsone_id: catsone_id,
            status: status,
            description: description,
            status: status,
            location: location
            )
        end
      end
    end
  end

  def get_jobs
    jobs_arr = []
    response = JSON.parse(self.class.get("/jobs", query: @options, headers: @headers))
    last_page = response["_links"]["last"]["href"].split("=")[1].to_i
    jobs_arr.push(response["_embedded"]["jobs"])
    i = 1
    while i < last_page
      @options[:page] = 1 + i
      response = JSON.parse(self.class.get("/jobs", query: @options, headers: @headers))
      jobs_arr.push(response["_embedded"]["jobs"])
      i += 1
    end
    parse_jobs(jobs_arr)
  end

  def users
    self.class.get("/2.2/users", @options)
  end
end
