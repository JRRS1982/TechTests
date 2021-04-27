# frozen_string_literal: true

require 'spec_helper'
require 'favourite'

RSpec.describe 'favourite' do
  let(:dummy_repo) { 'TEST0' }
  let(:different_repo) { 'TEST2' }
  let(:favourite) { Favourite.new }

  describe '#request' do
    it 'The API response from a different repo is saved' do
      favourite.request(data_requester_parameter: different_repo)
      expect(favourite.data[0]['owner']['login']).to eq(different_repo)
    end
  end

  describe '#print_out' do
    it 'creates a list of the languages' do
      favourite.request(data_requester_parameter: dummy_repo)
      favourite.print_out('language')
      expect(favourite.list).to eq(['Ruby'])
    end
  end
end
