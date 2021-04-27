# frozen_string_literal: true

require 'spec_helper'
require 'favourite'

RSpec.describe 'FEATURES' do
  let(:request_my_repo) do
    RestClient.get('https://api.github.com/users/TEST1/repos')
  end

  let(:my_repo) { 'TEST1' }
  let(:favourite) { Favourite.new }

  describe '#print_out' do
    it 'When no repository has been provided' do
      expect { favourite.print_out('language') }.to output('There appears to be nothing to print').to_stdout
    end

    it 'When a repository is provided' do
      favourite.request(data_requester_parameter: my_repo)
      expect { favourite.print_out('language') }.to output("The user's favourite language is probably Ruby").to_stdout
    end
  end

  describe '#request' do
    it 'Checks that a request to my repo is successful' do
      expect(request_my_repo.code).to be(200)
    end

    it 'The API response from my repo is saved' do
      favourite.request(data_requester_parameter: my_repo)
      expect(favourite.data[0]['owner']['login']).to eq(my_repo)
    end
  end
end
