class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'shh', password: 'secret', except: %i[index show]

  def index
    # @q = Article.ransack(params[:q])
    # @articles = @q.result(distinct: true)
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy!

    redirect_to root_path, status: :see_other
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :image_link, :language, :status)
    end

    def search
      return unless params[:q]

      search_params = CGI::escapeHTML(params[:q])
      redirect_to("http://localhost:3000/articles?q%5Btitle_or_body_cont%5D=#{search_params}&commit=Search&commit=Search")
    end
end
