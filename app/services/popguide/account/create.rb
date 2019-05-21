class Popguide::Account::Create < Popguide::Base

  REL_URL = '/accounts'

  attr_reader :account

  def self.call(_account)
    new(_account).call
  end

  def initialize(_account)
    super()
    @account = _account
  end

  # {
  #     'success' => true,
  #     'group' => {
  #         'id' => rand(9999),
  #         'created_at' => Time.now,
  #         'credentials' => [
  #             {
  #                 'username' => "KUD-#{rand(99999)}",
  #                 'password' => "#{rand(99999)}",
  #                 'qr_code' => 'e023e920je823hej923he32'
  #             }
  #         ]
  #     }
  # }
  def call
    response = HTTParty.post("#{BASE_URL}#{REL_URL}",
                             body: self.generate_body.to_json,
                             headers: self.generate_headers)
  end

  def generate_body
    {
        payment_method: self.account.payment_method,
        share_creds: self.account.share_creds,
        qty: self.account.qty,
        name: self.account.name,
        branding_id: self.account.branding_id,
        accesses: self.account.accesses.map{|r| { pop_map_id: r.to_i } }
    }
  end

end