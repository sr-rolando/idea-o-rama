class IdeasController < ApplicationController
  before_filter :authenticate_user!

  def new
    @topic = Topic.find(params[:topic_id])
    @idea = Idea.new
  end

  def create
    idea = Idea.new
    idea.title = params[:idea][:title]

    if idea.save
      flash[:notice] = 'Neue Idee gespeichert.'
      topic = Topic.find(params[:topic_id])
      redirect_to topic_path(topic)
    else
      flash[:error] = 'Fehler beim Speichern!'
      render :action => 'new'
    end
  end

end
