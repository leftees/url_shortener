class LinksController < ApplicationController

 before_action :set_link, only: [:show]
  
  def create
    @link = Link.new link_attributes

    respond_to do |format|
      if @link.save
        format.html { redirect_to links_all_path, notice: 'Link was successfully created.' }
        format.js
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    if @link
      redirect_to @link.url
    else
      redirect_to links_path, error: 'Link does not exist for the specified url shortener'
    end
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
      params.require(:link).permit(:url)
    end


end
