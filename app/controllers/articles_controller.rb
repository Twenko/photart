class ArticlesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]

  # GET /articles
  # GET /articles.json
  def index
    #@articles = Article.all
    @articles = Article.find(:all, :conditions => ["activate = ?", true], :order => "created_at")
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @posts = @article.posts.all
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(15)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    @article.update_attribute(:poster_id, current_admin.id)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, :notice => 'Article was successfully created.' }
        format.json { render :json => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, :notice => 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.update_attributes(:activate => false)

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
