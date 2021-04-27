RSpec.describe FavouriteLanguage do
  let(:favourite_language) { FavouriteLanguage.new }
  let(:my_repo) { 'JRRS1982' }
  let(:different_repo) { 'sjmog' }

  context '#request' do
    it 'responds to the request message' do
      expect(favourite_language).to respond_to(:request)
    end

    it 'saves data from my repo response into a variable' do
      favourite_language.request(my_repo)
      expect(favourite_language.data.class).to be(Array)
      expect(favourite_language.data[0]['owner']['login']).to eq('JRRS1982')
    end

    it 'saves data from another repo response into a variable' do
      favourite_language.request(different_repo)
      expect(favourite_language.data.class).to be(Array)
      expect(favourite_language.data[0]['owner']['login']).to eq('sjmog')
    end
  end

  context '#print_out' do
    it 'statement on another repo' do
      favourite_language.request(different_repo)
      expect { favourite_language.print_out }.to output("The user's favourite language is probably Ruby").to_stdout
    end
  end
end
