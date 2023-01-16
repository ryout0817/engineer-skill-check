class ArticlesController < ApplicationController
  def index
    @articles = Article.all.page(params[:page]).per(10)
    @employee = current_user.id
  end

  def new
    @article = Article.new
    @employee = current_user
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
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      @article.save
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy!
    redirect_to articles_path, notice: "記事を削除しました。"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :author)
  end
end
