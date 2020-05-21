class LinksController < ApplicationController
  before_action :load_links, only: [:index, :update]
  before_action :set_link, only: [:show, :update]

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
    @link.clicked = @link.clicked + 1
    if @link.save(touch: false)
      respond_to do |format|
        format.html { redirect_to @link.url }
        format.json { render status: :ok, json: { original_url: @link.url, clicked: @link.clicked } }
      end
    end
  end

  def index
    render
  end

  def update
    if @link.update(link_params)
      render status: :ok, json: { links: @links }
    end
  end

  private

    def link_params
      params.require(:link)
        .permit(:url, :pinned)
    end

    def load_links
      @links = Link.order(updated_at: :desc)
    end

    def set_link
      @link = Link.find_by!(slug: params[:slug])
    end

end
