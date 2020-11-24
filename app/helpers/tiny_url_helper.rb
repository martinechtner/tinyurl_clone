module TinyUrlHelper
  def original_url_formatter(original_url)
    url = URI.parse(original_url)
    if url.scheme.present?
      original_url
    else
      'http://' + url.path
    end
  end
end
