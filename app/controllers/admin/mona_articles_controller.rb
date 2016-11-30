class Admin::MonaArticlesController < AdminController
  before_action :set_mona_article, only: [:show, :edit, :update, :destroy]

  # GET /mona_articles
  def index
    @mona_article = MonaArticle.find_or_create_by(id: 1)
  end

  # GET /mona_articles/1
  def show
  end

  # GET /mona_articles/new
  def new
    @mona_article = MonaArticle.new
  end

  # GET /mona_articles/1/edit
  def edit
  end

  # POST /mona_articles
  def create
    @mona_article = MonaArticle.new(mona_article_params)

    if @mona_article.save
      redirect_to @mona_article, notice: 'Mona\'s lastest article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mona_articles/1
  def update
    if @mona_article.update(mona_article_params)
      redirect_to edit_admin_mona_article_path(@mona_article), notice: 'Mona\'s latest article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mona_articles/1
  def destroy
    @mona_article.destroy
    redirect_to mona_articles_url, notice: 'Mona article was successfully destroyed.'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def mona_article_params
      params.require(:mona_article).permit(:url)
    end
end
