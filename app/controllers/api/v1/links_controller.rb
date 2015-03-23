class Api::V1::LinksController < Api::V1::BaseController

 before_action :set_link, only: [:show]
  
  def create
    @link = Link.new link_attributes
    respond_to do |format|
      if @link.save
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @link
  end

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end 

  private

    def set_link
      @link = Link.find_by_shortened_url(params["shortened_url"])
    end

    def link_attributes
      params.permit(:url)
    end


end
