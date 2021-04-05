class PostsController < ApplicationController
  http_basic_authenticate_with name: 'brad', password: '1234', except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new

  end

  def create
    #render plain: params[:post].inspect
    @post = Post.new(post_params)

    if(@post.save)
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if(@post.update(post_params))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
