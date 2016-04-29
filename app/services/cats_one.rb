# service wrappper for CatsOne Api calls
class CatsOne
  include HTTParty
  require 'json'
  base_uri 'https://api.catsone.com/v3'

  def initialize(service: "", page: "")
    @headers = {"Authorization" => 'Token ' + ENV['UXHIRES_CATSONE_TOKEN'], "Content-Type" => "application/json", "Accept" => "application/json"}
    @options = {site: service, page: page}
  end

  def jobs
    arr = []
    JSON.parse(self.class.get("/jobs", query: @options, headers: @headers))
  end

  def users
    self.class.get("/2.2/users", @options)
  end
end
