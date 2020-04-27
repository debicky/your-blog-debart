class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :latest]
  require 'will_paginate/array'


  def latest
    @posts = []
    Post.order("created_at DESC").each.with_index do |post, index|
      @posts.push(post) unless index < 4
    end
    @posts = @posts.paginate(page: params[:page], per_page: 3)
  end



  # GET /posts
  # GET /posts.json
  def index
    @new_posts = Post.order("created_at DESC").take(4)
    @popular_posts = Post.order("views DESC").take(4)
    @random_post = Post.order("RANDOM()").limit(1)
    @posts_all = Post.all
    
    
  end
  
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.update(views: @post.views + 1)
    @comments = @post.comments.order("created_at DESC")
    @latest_commented = Post.includes(:comments).order("comments.created_at desc").limit(3)

    
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'And there is your new post!' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'We just updated your post!' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Your post was deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :thumbnail)
    end



end

