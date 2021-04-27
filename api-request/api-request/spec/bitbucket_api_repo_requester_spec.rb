# frozen_string_literal: true

require 'bitbucket_api_repo_requester'
require 'spec_helper'

RSpec.describe 'bitbucket_api_repo_requester' do
  let(:bitb_repo) { 'TESTBITB' }
  let(:bitbucket_api_repo_requester) { BitBucketApiRepoRequester.new }

  it 'Responds to a request method' do
    expect(bitbucket_api_repo_requester).to respond_to(:collect)
  end

  it 'Can parse into an array' do
    response = bitbucket_api_repo_requester.collect(bitb_repo)
    expect(response.code).to be(200)
  end
end
