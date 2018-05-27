class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

def index
  @articles = Article.all
end

def new
  @article = Article.new
  @article.user = current_user
end

def create
  @article = current_user.articles.build(article_params)
  if @article.save
    flash[:success] = "Article created!"
    redirect_to articles_path
  else
    redirect_to request.referrer
  end
end

def destroy
  @article.destroy
  flash[:success] = "Article deleted"
  redirect_to request.referrer
end

private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to request.referrer if @article.nil?
  end
end
