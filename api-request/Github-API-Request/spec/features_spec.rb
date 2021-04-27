RSpec.describe 'FEATURES' do
  let(:responseJRRS1982) do
    RestClient.get('https://api.github.com/users/JRRS1982/repos')
  end
  let(:my_repo) { 'JRRS1982' }
  let(:favourite_language) { FavouriteLanguage.new }

  describe 'External request to Github API' do
    it 'queries JRRS1982 repository on GitHub' do
      expect(responseJRRS1982.code).to be(200)
    end
  end

  describe 'Prints a statement' do
    it 'when there are no repositories' do
      expect { favourite_language.print_out }.to output('The user doesnt appear to have any repositories').to_stdout
    end

    it 'when a repository is provided' do
      favourite_language.request(my_repo)
      expect { favourite_language.print_out }.to output("The user's favourite language is probably Ruby").to_stdout
    end
  end
end
