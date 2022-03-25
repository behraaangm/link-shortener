require "rails_helper"

RSpec.describe LinksController, type: :controller do

  it "can create a Link record with a short url using the original url given by the user" do
    url = "https://www.myfavouritestartup.com/blog/how-to-minimize-risk"

    request.env["HTTP_ACCEPT"] = "text/javascript"
    post :create, params: { link: { original_url: url } }

    link = assigns(:link)
    expect(link.original_url).to eq(url)
    expect(link.valid?).to be(true)
    expect(link.short_url.length).to eq(7)
    expect(link.persisted?).to be(true)
    expect(response).to render_template('create')
  end
end
