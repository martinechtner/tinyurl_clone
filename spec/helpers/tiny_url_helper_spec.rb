RSpec.describe TinyUrlHelper, type: :helper do
  describe 'original_url_formatter' do
    let(:url) { 'google.com' }

    it 'returns a formatted url' do
      expect(original_url_formatter(url)).to eq 'http://google.com'
    end
  end
end
