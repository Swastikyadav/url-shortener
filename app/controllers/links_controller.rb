class LinksController < ApplicationController

  def create
    @existing_link = Link.where(url: params[:link][:url]).first
    
    if @existing_link
      render status: :ok, json: { slug: @existing_link.slug }
    else
      @link = Link.new(link_params)
      @link.generate_slug
      if @link.save
        render status: :ok, json: { slug: @link.slug }
      else
        render status: :unprocessable_entity, json: { errors: @link.errors.full_messages }
      end
    end
  end

  def show
    @link = Link.find_by!(slug: params[:slug])
    render status: :ok, json: { original_url: @link.url }
  end

  def index
    render
  end

  private

    def link_params
      params.require(:link)
        .permit(:url)
    end

end
