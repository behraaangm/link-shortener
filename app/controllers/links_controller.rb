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

  def index
    @links = Link.all.paginate(page: params[:page], per_page: 5)
  end

  def reveal
    @link = Link.find(params[:id])
  end

  def hide
    @link = Link.find(params[:id])
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

end
