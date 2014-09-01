class AdventuresController < ApplicationController

  def index
    @advntures = Adventure.all
    render('advntures/index.html.erb')
  end

  def new
    @adventure = Adventure.new
    render('adventures/new.html.erb')
  end

  def create
    @adventure = Adventure.new(params[:adventure])
    if @adventure.save
      redirect_to("/adventures/#{@adventure.id}")
      flash[:notice] = "Welcome to your adventure #{@adventure.username}."
    else
      render('adventures/index.html.erb')
    end
  end

  # def show
  #   @user = User.find(params[:id])
  #   @tagged = Tag.where(user_id: @user.id)
  # end

  # def destroy
  #   @user = User.find(params[:user_id])
  #   @photos = @user.photos
  #   @photos.each do |photo|
  #     @tags = photo.tags
  #     @tags.each do |tag|
  #       tag.destroy
  #     end
  #     photo.destroy
  #   end
  #   @user.destroy
  #   flash[:notice] = "Shunned."
  #   redirect_to users_path
  # end

end
