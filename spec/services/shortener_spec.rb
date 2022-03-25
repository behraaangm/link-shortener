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

  it "Always gives a specific URL the same short url" do
    url = "https://www.myfavouritestartup.com/blog/how-to-minimize-risk"
    shortener_a = Shortener.new(url)
    shortener_b = Shortener.new(url)
    expect(shortener_a.short_url).to eq(shortener_b.short_url)
  end

end
