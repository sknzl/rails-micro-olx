class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :new, :index]
  before_action :correct_user,   only: :index

def index
  @user_messages = []
  @articles.each do |article|
  @user_messages << Message.find_by(article_id: article.id)
  end
end


def new
  @message = Message.new
  @message.user = current_user
  @article = Article.find(params[:article_id])

end

def create
  @message = Message.new(message_params)
  @message.article_id = params[:article_id]
  @message.user_id = current_user.id
  if @message.save
    flash[:success] = "Message sent!"
    redirect_to articles_path
  else
    redirect_to request.referrer
  end
end


private

  def message_params
    params.require(:message).permit(:content)
  end

  def correct_user
    @articles = current_user.articles
    redirect_to request.referrer if @articles.nil?
  end
end
