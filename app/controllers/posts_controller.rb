class PostsController < ApplicationController
  #skip_before_filter :index, :show
  before_filter :check_if_admin, :except => [:new]
  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.all
#    @posts = Post.order("created_at").page(params[:page]).per(10)
    if admin_signed_in?
      @posts = Post.find(:all, :conditions => ["activate = ?", true], :order => "created_at")
      @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(20)
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @posts }
      end
    else
      raise 'Please sign in!'
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
    #if Article.find(:first, :conditions => ["id = ?", params[:article]])
    #iddd = params[:article]
    #@post.attributes = {:article_id => iddd}
    #@post.attributes = {:poster_id => @utili.id}
    #@post.attributes = {:adorus => admin_signed_in?}
    #else
    #  raise 'ID non valide!'
    #end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    
    @post = Post.find(params[:id])

    unless current_admin
      if Time.now.to_i > (@post.created_at + 5.minutes).to_i
        raise 'Edition impossible au-dela de 5 minutes'
      end
    end
    
    
    if @post.poster_id != @utili.id
      #render :action => :index
      redirect_to root_path
    end
    if !(user_signed_in? || admin_signed_in?)
        redirect_to root_path
    end
    
    @editoration = 1
  end
  # POST /posts

  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.update_attribute(:poster_id, @utili.id)
    @post.update_attribute(:adorus, admin_signed_in?)
    if @post.poster_id==nil
      @post.update_attributes(:activate=>false)
    end
    #params[:poster_id] = @utili.id => wrong way of doing
#    @post.update_attribute(:poster_id, @utili.id)
#    @post.update_attribute(:adorus, admin_signed_in?)
    #iddd = params[:article]
    #idaag = Article.find(iddd).id
#    @post.update_attribute(:article_id, iddd)

    respond_to do |format|
      if @post.save
        format.html { redirect_to Article.find(@post.article_id), :notice => 'Post was successfully created.' }
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
        format.html { redirect_to Article.find(@post.article_id), :notice => 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    if admin_signed_in?
      @post.update_attributes(:activate => false)

      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end
  
  def check_if_admin
    if user_signed_in? || admin_signed_in?
    else
    # or you can use the authenticate_user! devise provides to only allow signed_in users
      redirect_to new_user_session_path
    end
  end
  
end
