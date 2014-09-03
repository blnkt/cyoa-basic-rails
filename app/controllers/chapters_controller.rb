class ChaptersController < ApplicationController

  def index
    @adventure = Adventure.find(params[:adventure_id])
    @chapters = Chapter.all
    redirect_to("/adventures/#{@adventure.id}/chapters/#{@adventure.chapters.last.id}")
  end

  def new
    @chapter = Chapter.new(params[:chapter][:prompt])
    @adventure = params[:adventure_id]
    render('chapters/new.html.erb')
  end

  def create
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    if @chapter.add_choice(params[:chapter].values.first)
      @adventure.add_chapter(Chapter.all.last)
      redirect_to("/adventures/#{@adventure.id}/chapters/#{@chapter.id}")
      flash[:notice] = "A new branch added to #{@adventure.username}'s adventure."
    else
      render('chapters/show.html.erb')
    end
  end

  def edit
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    render('chapters/edit.html.erb')
  end

  def update
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    if @chapter.update(episode: params[:chapter].values.first)
      render('chapters/show.html.erb')
    else
      render('chapters/edit.html.erb')
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
