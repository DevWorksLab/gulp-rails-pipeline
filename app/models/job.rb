class Job < ActiveRecord::Base

  scope :active, -> { where(status: "active") }


  def self.update_listings
    cats = CatsOne.new(
      options: {
        page: 1,
        display_column: ["id", "title", "description", "is_hot", "company",
          "type", "tags", "location", "status", "extra_field203722",
          "extra_field196083", "extra_field196086", "extra_field196089"],
        rows_per_page: 50 }
        )
    cats.get_jobs
  end

  def self.update_descriptions
    jobs = Job.active
    job_array = jobs.each_slice(50).to_a
    job_array.each do |cluster|
      ids = jobs.pluck(:catsone_id)
      cats = CatsOne.new(options: {id: ids, result: "normal"})
      api_response = cats.get_job_descriptions
    end
  end

end
