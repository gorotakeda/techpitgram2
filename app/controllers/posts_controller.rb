class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :destroy]

  def new
    @post = Post.new
    @post.photos.build
    # buildもnewと同じくインスタンスを作成するメソッド
  end

  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が完了しました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end
  
  def index
    @posts = Post.limit(10).includes(:photos, :user).order('created_at DESC')
  end

  def show
  end

  def destroy
    if @post.user == current_user
      flash[:notice] = "投稿が削除されました" if @post.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end
end
