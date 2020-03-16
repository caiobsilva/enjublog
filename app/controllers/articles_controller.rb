class ArticlesController < ApplicationController
  def index
    @articles = Article.where(deleted_at: nil)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = 'Artigo criado com sucesso'
      redirect_to @article
    else
      flash[:error] = 'Criação de artigo falhou'
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
  
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.update(deleted_at: DateTime.now)
  
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
