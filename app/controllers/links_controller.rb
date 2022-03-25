class LinksController < ApplicationController

  def create
    shortener = Shortener.new(link_params[:original_url])
    @link = shortener.create_link
    if @link.persisted?

    else
      render 'error.js.erb'
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

end
