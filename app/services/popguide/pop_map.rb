class Popguide::PopMap < Popguide::Base

  REL_URL = '/pop_maps'

  def list
    HTTParty.get("#{BASE_URL}#{REL_URL}", headers: self.generate_headers)["pop_maps"]
  end

  def remote_sync
    self.list.each do |row|
      _cy = ::PopMap.where(id: row['id']).first_or_initialize
      _cy.name = row['name']
      _cy.public_name = row['public_name']
      _cy.pm_type = row['type']
      _cy.autoplay = row['autoplay']
      _cy.location = Location.find_by_id(row['location']['id'])
      _cy.save
    end
  end

end