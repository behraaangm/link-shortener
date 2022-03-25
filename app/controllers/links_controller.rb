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
    redirect_link = link.original_url
    unless redirect_link[/\Ahttp:\/\//] || redirect_link[/\Ahttps:\/\//]
      redirect_link = "http://#{redirect_link}"
    end

    redirect_to redirect_link
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
