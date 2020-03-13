class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = 'Artigo criado com sucesso'
      redirect_to article_path(@article)
    else
      flash[:error] = 'Criação de artigo falhou'
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
