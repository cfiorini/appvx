class Popguide::Base

  BASE_URL = 'https://staging.popguide.me/partners_api/v2'
  TOKEN_URL = '/sessions'

  attr_reader :api_key, :api_secret

  def initialize

    @api_key = Rails.application.credentials.popguide[:key]
    @api_secret = Rails.application.credentials.popguide[:secret]

  end

  def self.list
    new.list
  end

  def self.remote_sync
    new.remote_sync
  end

  def api_token
    qs = {k: self.api_key, s: self.api_secret}
    @api_token = HTTParty.post("#{BASE_URL}#{TOKEN_URL}?#{qs.to_query}")["token"]
  end

  def generate_headers
    {'Content-Type' => 'application/json', 'Authorization' => "Token token=#{self.api_token}"}
  end

end