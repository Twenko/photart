class PostsController < ApplicationController
  #skip_before_filter :index, :show
  before_filter :check_if_admin, :except => [:index]

  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.all
    @posts = Post.order("created_at").page(params[:page]).per(5)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    
    @post = Post.find(params[:id])
    
    if @post.poster_id != @utili.id
      #render :action => :index
      redirect_to root_path
    else
      if @post.adorus
        if user_signed_in?
          redirect_to root_path
        end
      else
        if !(user_signed_in? || admin_signed_in?)
          redirect_to root_path
        end
      end
    end
    
    @editoration = 1
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    #params[:poster_id] = @utili.id
    @post.update_attribute(:poster_id, @utili.id)
    @post.update_attribute(:adorus, admin_signed_in?)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, :notice => 'Post was successfully created.' }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    #params[:poster_id] = @utili.id
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

private

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def check_if_admin
    if user_signed_in? || admin_signed_in?
    else
    # or you can use the authenticate_user! devise provides to only allow signed_in users
      raise 'Please sign in!'
    end
  end
  
end
