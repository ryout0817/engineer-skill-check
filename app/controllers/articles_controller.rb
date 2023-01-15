class ArticlesController < ApplicationController
  before_action :set_employee,  only: %i(show)

  def index
    @articles = Article.all
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
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update

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

  def set_employee
    @employee = Employee.find(params["employee_id"])
  end
end
