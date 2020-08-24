class PostsController < ApplicationController
  def index
     @posts = Post.all.order(id: "DESC")
  end

  # def new
  # end

  def create
    post = Post.create(content: params[:content], checked: false)
    # モデル名.create(保存したいカラム名:(つまりキー) 保存する値(つまりバリュー))
    # 「content」という名前の箱でへデータを送り保存する
    # redirect_to action: :index
    render json:{post: post}
  end

  def checked

    # binding.pry

    post = Post.find(params[:id])
    if post.checked then
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end
