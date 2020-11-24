RSpec.describe UrlVisitor, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:tiny_url) }
  end

  describe 'validations' do
    it { validate_presence_of(:tiny_url) }
    it { validate_presence_of(:ip) }
  end
end
