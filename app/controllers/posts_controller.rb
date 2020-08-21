class PostsController < ApplicationController
  def index
     @posts = Post.all.order(id: "DESC")
  end

  # def new
  # end

  def create
    Post.create(content: params[:content])
    # モデル名.create(保存したいカラム名:(つまりキー) 保存する値(つまりバリュー))
    # 「content」という名前の箱でへデータを送り保存する
    redirect_to action: :index
  end

end
