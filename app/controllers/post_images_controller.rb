class PostImagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page]).reverse_order
  end

  def rank
    @all_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').limit(10).pluck(:post_image_id))
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = PostComment.where(post_image_id: @post_image.id)
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
  def tag
    if @tag = params[:tag]   # タグ検索用
      @post_images = PostImage.tagged_with(params[:tag])   # タグに紐付く投稿
    end
  end

  private
  def post_image_params
    params.require(:post_image).permit(:image, :caption, :tag_list)
  end
  
end
