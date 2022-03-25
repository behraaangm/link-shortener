require 'digest/sha2'

class Shortener

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def short_url
    Digest::SHA2.hexdigest(@url)[0..6]
  end

end
