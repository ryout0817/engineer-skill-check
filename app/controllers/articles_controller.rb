class ArticlesController < ApplicationController
  def index
    @articles = if params[:latest]
                  Article.latest.page(params[:page]).per(10)
                elsif params[:old]
                  Article.old.latest.page(params[:page]).per(10)
                else
                  Article.all.page(params[:page]).per(10)
                end
    @employee = current_user.id
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @employee = current_user
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "お知らせを登録しました。"
    else
      render :new
    end
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
    redirect_to articles_path, notice: "お知らせを削除しました。"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :author)
  end
end
