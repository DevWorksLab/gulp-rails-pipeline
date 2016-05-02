class Job < ActiveRecord::Base

  scope :active, -> { where(status: "active") }


  def self.update_listings
    cats = CatsOne.new(options: { page: 1 })
    cats.get_jobs
  end

end
