class LinksController < ApplicationController

  def create
    @link = Link.new(link_params)
    @link.slug = @link.generate_slug
    if @link.save
      render status: :ok, json: { success: true, slug: @link.slug }
    else
      render status: :unprocessable_entity, json: { success: false, errors: @link.errors.full_messages }
    end
  end

  def show
    @link = Link.find_by!(slug: params[:slug])
    render json: { original_url: @link.url }
  end

  private

    def link_params
      params.require(:link)
        .permit(:url)
    end

end
