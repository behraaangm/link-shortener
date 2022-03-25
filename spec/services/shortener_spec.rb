require "rails_helper"

RSpec.describe Shortener do

  it "shortens a given URL to a 7 character short url" do
    url = "https://www.myfavouritestartup.com/blog/how-to-minimize-risk"
    shortener = Shortener.new(url)
    expect(shortener.short_url.length).to eq(7)
  end

  it "gives each URL its own short url" do
    url1 = "https://www.myfavouritestartup.com/blog/how-to-minimize-risk"
    url2 = "https://www.myfavouritestartup.com/blog/how-to-minimize-risk-in-a-volotile-situation"
    shortener1 = Shortener.new(url1)
    shortener2 = Shortener.new(url2)
    expect(shortener1.short_url).not_to eq(shortener2.short_url)
  end

  it 'generates a Link with a uniq short url' do
    url = "https://www.myfavouritestartup.com/blog/how-to-minimize-risk"
    shortener = Shortener.new(url)
    link = shortener.create_link
    expect(link.valid?).to be(true)

    link2 = shortener.create_link
    expect(link2.valid?).to be(true)
  end

end
