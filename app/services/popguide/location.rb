class Popguide::Location < Popguide::Base

  REL_URL = '/locations'

  def list
    HTTParty.get("#{BASE_URL}#{REL_URL}", headers: self.generate_headers)["locations"]
  end

  def remote_sync
    self.list.each do |row|
      _cy = ::Location.where(id: row['id']).first_or_initialize
      _cy.name = row['name']
      _cy.country = Country.find_by_id(row['country']['id'])
      _cy.save
    end
  end

end