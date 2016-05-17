class Admin::ExternalLinksController < AdminController
  before_action :set_external_link, only: [:show, :edit, :update, :destroy]

  # GET /external_links
  def index
    @external_links = ExternalLink.all
  end

  # GET /external_links/1
  def show
  end

  # GET /external_links/new
  def new
    @external_link = ExternalLink.new
  end

  # GET /external_links/1/edit
  def edit
  end

  # POST /external_links
  def create
    @external_link = ExternalLink.new(external_link_params)

    if @external_link.save
      redirect_to admin_external_link_path(@external_link), notice: 'External link was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /external_links/1
  def update
    if @external_link.update(external_link_params)
      redirect_to admin_external_link_path(@external_link), notice: 'External link was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /external_links/1
  def destroy
    @external_link.destroy
    redirect_to external_links_url, notice: 'External link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_link
      @external_link = ExternalLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def external_link_params
      params.require(:external_link).permit(:link_type, :title, :url)
    end
end
