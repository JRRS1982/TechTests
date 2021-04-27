# frozen_string_literal: true

require 'rspec'
require 'pry'
require 'rest-client'
require 'json'

require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, 'https://api.bitbucket.org/2.0/repositories/TESTBITB/').to_return(
      body: File.new('spec/support/TESTBITB.json'), status: 200
    )

    stub_request(:any, 'https://api.github.com/users/TEST0/repos').to_return(
      body: File.new('spec/support/TEST0.json'), status: 200
    )
    stub_request(:any, 'https://api.github.com/users/TEST1/repos').to_return(
      body: File.new('spec/support/TEST1.json'), status: 200
    )
    stub_request(:any, 'https://api.github.com/users/TEST2/repos').to_return(
      body: File.new('spec/support/TEST2.json'), status: 200
    )
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
