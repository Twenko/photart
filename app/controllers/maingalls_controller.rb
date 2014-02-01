class MaingallsController < ApplicationController
  # GET /maingalls
  # GET /maingalls.json
  def index
    @maingalls = Maingall.all
    @single_gal = Gallery.find(:all, :conditions => ["maingall_id = ?", 0])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @maingalls }
    end
  end

  # GET /maingalls/1
  # GET /maingalls/1.json
  def show
    @maingall = Maingall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @maingall }
    end
  end

  # GET /maingalls/new
  # GET /maingalls/new.json
  def new
    @maingall = Maingall.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @maingall }
    end
  end

  # GET /maingalls/1/edit
  def edit
    @maingall = Maingall.find(params[:id])
  end

  # POST /maingalls
  # POST /maingalls.json
  def create
    @maingall = Maingall.new(params[:maingall])

    respond_to do |format|
      if @maingall.save
        format.html { redirect_to @maingall, :notice => 'Maingall was successfully created.' }
        format.json { render :json => @maingall, :status => :created, :location => @maingall }
      else
        format.html { render :action => "new" }
        format.json { render :json => @maingall.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /maingalls/1
  # PUT /maingalls/1.json
  def update
    @maingall = Maingall.find(params[:id])

    respond_to do |format|
      if @maingall.update_attributes(params[:maingall])
        format.html { redirect_to @maingall, :notice => 'Maingall was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @maingall.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /maingalls/1
  # DELETE /maingalls/1.json
  def destroy
    @maingall = Maingall.find(params[:id])
    @maingall.destroy

    respond_to do |format|
      format.html { redirect_to maingalls_url }
      format.json { head :no_content }
    end
  end
end
