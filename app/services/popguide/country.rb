class Popguide::Country < Popguide::Base

  REL_URL = '/countries'

  def list
    HTTParty.get("#{BASE_URL}#{REL_URL}", headers: self.generate_headers)["countries"]
  end

  def remote_sync
    self.list.each do |row|
      _cy = ::Country.where(id: row['id']).first_or_initialize
      _cy.name = row['name']
      _cy.code = row['code']
      _cy.save
    end
  end

end