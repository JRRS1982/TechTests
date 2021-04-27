require 'rest-client'
require 'json'

# this is going to be the main controller type class for the program.
class FavouriteLanguage
  attr_accessor :data, :language_list, :result

  def initialize
    @data = data
    @language_list = []
    @result = []
  end

  def request(string)
    response = RestClient.get("https://api.github.com/users/#{string}/repos")
    @data = JSON.parse(response)
  end

  def print_out
    create_language_list(@data)
    most_common(@language_list)
    print_results(@result)
  end

  private

  def print_results(result)
    if result.nil?
      print 'The user doesnt appear to have any repositories'
    else
      print "The user's favourite language is probably #{result}"
    end
  end

  def create_language_list(data = @data)
    @language_list = []
    return unless !data.nil?
    data.select do |each_hash|
      @language_list << each_hash['language']
    end
  end

  def most_common(language_list)
    @result = language_list.uniq.max_by do |i|
      language_list.count(i)
    end
  end
end
