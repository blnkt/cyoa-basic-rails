class ChaptersController < ApplicationController

  def index
    @adventure = Adventure.find(params[:adventure_id])
    @chapters = Chapter.all
    redirect_to("/adventures/#{@adventure.id}/chapters/#{@adventure.chapters.last.id}")
  end

  def new
    @chapter = Chapter.new
    @adventure = params[:adventure_id]
    @adventure.add_chapter
    render('chapters/new.html.erb')
  end

  def create
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    if @chapter.add_choice(params[:prompt])
      redirect_to("/adventures/@adventure/#{@adventure.id}/chapters/#{@chapter.id}")
      flash[:notice] = "A new branch added to #{@adventure.username}'s adventure."
    else
      render('chapters/show.html.erb')
    end
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    render('chapters/show.html.erb')
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    flash[:notice] = "Chapter destroyed."
    redirect_to("/adventures")
  end

end
