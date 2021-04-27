# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'github_api_repo_requester' do
  let(:my_repo) { 'TEST1' }
  let(:github_api_repo_requester) { GitHubApiRepoRequester.new }

  it 'Responds to a request method' do
    expect(github_api_repo_requester).to respond_to(:collect)
  end

  it 'Can parse into an array' do
    response = github_api_repo_requester.collect(my_repo)
    expect(response.code).to be(200)
  end
end
