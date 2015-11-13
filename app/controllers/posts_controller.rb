class PostsController < ApplicationController
  
before_action :authenticate_user!
  
  def index
      @posts = Post.where(user_id: current_user.id).all.paginate(:page => params[:page], :per_page => 2)
      render "index"
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(Post.find(params[:id]).user_id)
  render "show"
  end

  def new
    @post = Post.new
    render "new"
  end
  
  def create
    Post.create(post_params)
    redirect_to root_path
  end
  
private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

end
