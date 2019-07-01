class PostsController < ApplicationController
  before_action :logged_in?, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def index
    if params[:term].present?
      @posts = Post.search(params[:term])
      @songs = Song.search(params[:term])
    else
      @posts = Post.all.page params[:page]
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save!
        format.js
        format.html {redirect_to @post, notice: 'Post was successfully created.'}
        format.json {render :show, status: :created, location: @post}
      else
        format.html {render :new}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html {redirect_to @post, notice: 'Tweet was successfully updated.'}
        format.json {render :show, status: :ok, location: @post}
      else
        format.html {render :edit}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def repost
    @post = current_user.posts.new(repost_params)
    respond_to do |format|
      if @post.save!
        format.js
        format.html {redirect_to @post, notice: 'Post was successfully created.'}
        format.json {render :show, status: :created, location: @post}
      else
        format.html {render :new}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      flash[:success] = "Post deleted"
      format.js
      format.html
    end
  end

  def show
    @user = User.find(@post.user_id)
    @post = Post.find(params[:id])

  end


  private

  def post_params
    params.require(:post).permit(:user_id, :context, :post_id, images: [])
  end

  def repost_params
    params.permit(:user_id, :post_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end

end
