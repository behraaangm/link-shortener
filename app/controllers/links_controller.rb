class LinksController < ApplicationController

  def create
    shortener = Shortener.new(link_params[:original_url])
    @link = shortener.create_link
    if @link.persisted?

    else
      render 'error.js.erb'
    end
  end

  def show
    link = Link.find_by(short_url: params[:short_url])

    redirect_to link.original_url
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

end
