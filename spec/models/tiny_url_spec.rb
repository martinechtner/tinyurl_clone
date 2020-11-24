RSpec.describe TinyUrl, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:url_visitors).dependent(:destroy) }
  end

  describe 'validations' do
    it { validate_presence_of(:mini_url) }
    it { validate_presence_of(:original_url) }
  end

  describe 'before_validation' do
    context 'build_mini_url' do
      it 'creates a random 6 character mini_url' do
        tiny_url = create(:tiny_url, original_url: 'www.google.com')

        expect(tiny_url.mini_url).to_not be_nil
        expect(tiny_url.mini_url.length).to eq 6
      end
    end
  end

  describe 'formatted_original_url' do
    let(:tiny_url) { create(:tiny_url, original_url: 'google.com') }

    it 'returns a formatted url' do
      expect(tiny_url.formatted_original_url).to eq 'http://google.com'
    end
  end
end
