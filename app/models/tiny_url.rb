class TinyUrl < ApplicationRecord
  validates_presence_of :mini_url, :original_url

  before_validation :build_mini_url

  private

    def build_mini_url
      loop do
        self.mini_url = SecureRandom.hex(3)
        break if TinyUrl.where(mini_url: self.mini_url).empty?
      end
    end
end
