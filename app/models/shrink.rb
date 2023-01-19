class Shrink < ApplicationRecord
  before_create do
    generate_shortendurl
  end

  def generate_shortendurl
    _status, link = ShortenUrl.new.call(url)
    self.shortend_url = link
  end
end
