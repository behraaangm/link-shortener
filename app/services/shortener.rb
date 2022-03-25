require 'digest/sha2'

class Shortener

  attr_reader :url, :link_model

  def initialize(url, link_model = Link)
    @url = url
    @link_model = link_model
  end

  def short_url
    i = 0
    loop do
      code = new_short_url(i)
      break code unless link_model.exists?(short_url: code)
      i += 1
    end
  end

  def create_link
    link_model.create(
      original_url: url,
      short_url: short_url
    )
  end

  private

  def new_short_url(iterator)
    Digest::SHA2.hexdigest(url)[iterator..(iterator + 6)]
  end

end
