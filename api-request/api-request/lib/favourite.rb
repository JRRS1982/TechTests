# frozen_string_literal: true

require_relative 'github_api_repo_requester'
require_relative 'most_common_in_array'
require_relative 'create_array_from_hash'
require 'json'

# this is the main class object that we are going to be working with.
class Favourite
  include MostCommonInArray
  include CreateArrayFromHash

  attr_reader :data, :list, :input, :result

  def initialize
    @data = []
    @list = []
    @input = ''
    @result = []
  end

  # rather than limit the use of the code to just favourite language I thought that it may be important to keep it open for extension, therefore any object that returns a JSON can be used and we can pass that object a parameter.
  def request(data_requester_parameter:, data_requester: data_requester = GitHubApiRepoRequester.new)
    data_temp = data_requester.collect(data_requester_parameter)
    @data = JSON.parse(data_temp)
  end

  # so here i want to process the raw data that has been requested..... and create an array..... which removes th need for a array from hash module in printout or create a hash which is then passed into printout method.
  def process(data = @data, data_processor = github_api_language_processor)
    data.each do |x|
      x
    end
  end

  # we dont necessarily need to search for language in the Array, so if I use a
  # parameter in the print out method i can search for other keys... and find an
  # alternate favourite thing, maybe wiki instead of language or another option?
  def print_out(language_or_other_requirement)
    @list = create_array_from_hash(hash: @data, key: language_or_other_requirement)

    @result = most_common_in_array(array: @list)
    print_results(@result, language_or_other_requirement)
  end

  private

  def print_results(result, language_or_other_requirement)
    if result.nil?
      print 'There appears to be nothing to print'
    else
      print "The user's favourite #{language_or_other_requirement} is probably #{result}"
    end
  end
end
