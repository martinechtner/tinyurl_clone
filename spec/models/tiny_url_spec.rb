RSpec.describe TinyUrl, type: :model do
  describe 'validations' do
    it { validate_presence_of(:mini_url) }
    it { validate_presence_of(:original_url) }
  end

  describe 'before_validation' do
    describe 'build_mini_url' do
      it 'creates a random 6 character mini_url' do
        tiny_url = create(:tiny_url, original_url: 'www.google.com')

        expect(tiny_url.mini_url).to_not be_nil
        expect(tiny_url.mini_url.length).to eq 6
      end
    end
  end
end
