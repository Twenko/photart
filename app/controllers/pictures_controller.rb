class PicturesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.find(:all, :conditions => ["activate = ?", true])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])
    if admin_signed_in?
      @picture.update_attributes(:admin => @utili)
    end
    #if user_signed_in?
    #  @picture.update_attributes(:user => @utili)
    #end

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, :notice => 'Picture was successfully created.' }
        format.json { render :json => @picture, :status => :created, :location => @picture }
      else
        format.html { render :action => "new" }
        format.json { render :json => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, :notice => 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.update_attributes(:activate => false)

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end
end
