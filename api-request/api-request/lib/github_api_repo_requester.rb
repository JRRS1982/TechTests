# frozen_string_literal: true

require 'rest-client'
require 'json'

# keeping it single responsability and clear.
class GitHubApiRepoRequester
  def collect(profile)
    response = RestClient.get("https://api.github.com/users/#{profile}/repos")
    response
  end
end
