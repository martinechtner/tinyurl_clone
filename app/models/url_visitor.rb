class UrlVisitor < ApplicationRecord
  belongs_to :tiny_url

  validates_presence_of :ip, :tiny_url
end
