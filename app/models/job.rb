class Job < ActiveRecord::Base

  scope :active, -> { where(status: ["Active (1)", "Active (2)"], public: true).order("status asc") }


  def self.update_listings
    cats = CatsOne.new(
      options: {
        page_number: 0,
        rows_per_page: 50 }
        )
    cats.get_jobs
  end

  def self.update_descriptions
    jobs = Job.pluck(:catsone_id)
    job_array = jobs.each_slice(50).to_a
    job_array.each do |cluster|
      puts cluster
      cats = CatsOne.new(options: {id: cluster, result: "extended"})
      api_response = cats.get_job_descriptions
    end
  end

end
