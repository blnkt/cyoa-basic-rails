class ChaptersController < ApplicationController

  def create
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    @potential = @chapter.add_choice(params[:chapter].values.first)
    if @potential.prompt != ""
      @adventure.add_chapter(Chapter.all.last)
      flash[:notice] = "A new branch added to #{@adventure.username}'s adventure."
      redirect_to("/adventures/#{@adventure.id}/chapters/#{@chapter.id}")
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
    unless params[:chapter].values.first == ""
      @chapter.update(episode: params[:chapter].values.first)
      render('chapters/show.html.erb')
    else
      render('chapters/show.html.erb')
    end
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    render('chapters/show.html.erb')
  end

end
