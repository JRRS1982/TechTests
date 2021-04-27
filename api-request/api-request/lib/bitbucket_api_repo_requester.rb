# frozen_string_literal: true

require 'rest-client'
require 'json'

# keeping it single responsability and clear.
class BitBucketApiRepoRequester
  def collect(profile)
    response = RestClient.get("https://api.bitbucket.org/2.0/repositories/#{profile}/")
    response
  end
end
