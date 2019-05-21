class Popguide::Language < Popguide::Base

  REL_URL = '/languages'

  def list
    HTTParty.get("#{BASE_URL}#{REL_URL}", headers: self.generate_headers)["languages"]
  end

end