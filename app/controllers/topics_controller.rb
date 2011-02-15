class TopicsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @topics = Topic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @topics }
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  # prepare for new entry
  def new
    @topic = Topic.new
  end
  
  # new entry has been submitted
  def create
    topic = Topic.new
    topic.title = params[:topic][:title]
    if topic.save
      flash[:notice] = 'Neuer Topic angelegt.'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Doh. Fehler beim Speichern eines neuen Topics!'
      render :action => 'new'
    end
  end

  def update
    Log.info("blurb")
  end
end
