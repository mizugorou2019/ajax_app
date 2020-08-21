class PostsController < ApplicationController
  def index
     @posts = Post.all
  end

  def new
  end

  def create
    Post.create(memo: params[:memo])
    # モデル名.create(保存したいカラム名:(つまりキー) 保存する値(つまりバリュー))
    # 「memo」という名前の箱でへデータを送り保存する
  end

end
