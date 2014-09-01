class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    render('adventures/index.html.erb')
  end

  def new
    @adventure = Adventure.new
    render('adventures/new.html.erb')
  end

  def create
    @adventure = Adventure.new(params[:adventure])
    if @adventure.save
      redirect_to("/adventures/#{@adventure.id}/chapters/#{@adventure.chapters.first.id}")
      flash[:notice] = "Welcome to your adventure #{@adventure.username}."
    else
      render('adventures/index.html.erb')
    end
  end

  def show
    @adventure = Adventure.find(params[:id])
    @chapters = @adventure.chapters
  end

  def destroy
    @adventure = Adventure.find(params[:id])
    @adventure.destroy
    flash[:notice] = "Adventure over."
    redirect_to("/adventures")
  end

end
