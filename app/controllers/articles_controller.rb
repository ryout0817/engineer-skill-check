class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "プロフィールを登録しました。"
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :author)
  end
end
