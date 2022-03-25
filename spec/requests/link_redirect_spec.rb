require "rails_helper"

RSpec.describe "Link redirect", type: :request do

  it "redirects to the original URL when given a shortened URL" do
    url = "https://www.customink.com/"
    shortener = Shortener.new(url)
    link = shortener.create_link

    get link.full_short_url
  end

end
