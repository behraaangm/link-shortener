require 'rails_helper'

RSpec.describe Link, type: :model do

  it "is invalid if it does not have a short url" do
    link = Link.new(
      original_url: "https://www.myfavouritestartup.com/blog/how-to-minimize-risk"
    )
    expect(link.valid?).to be(false)
  end

  it "is invalid if it does not have a original_url" do
    link = Link.new(
      short_url: "1234567"
    )
    expect(link.valid?).to be(false)
  end

  it "always has an original URL and a short url" do
    link = Link.new(
      original_url: "https://www.myfavouritestartup.com/blog/how-to-minimize-risk",
      short_url: "1234567"
    )
    expect(link.valid?).to be(true)
  end

  it "is invalid if the short_url already exists" do
    _link = Link.create(
        original_url: "https://www.myfavouritestartup.com/blog/how-to-minimize-risk",
        short_url: "1234567"
    )
    link2 = Link.new(
        original_url: "https://www.myfavouritestartup.com/blog/how-to-minimize-violence",
        short_url: "1234567"
    )
    expect(link2.valid?).to be(false)
  end

end
