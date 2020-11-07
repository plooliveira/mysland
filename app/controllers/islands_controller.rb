class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_island, only: [:show, :update, :destroy, :edit]

  def index
    if params[:query].present?
      @islands = Island.island_pg_search(params[:query])
    else
      @islands = Island.all
    end



  end

  def show
    @island = Island.find(params[:id])
    @reservation = Reservation.new
    @markers = [{ lat: @island.latitude, lng: @island.longitude }]
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    print current_user
    @island.user_id = current_user.id
    if @island.save
      redirect_to islands_path
    end
  end

  def edit
  end

  def update
    @islands.update(island_params)
    redirect_to islands_path(@island)
  end

  def destroy
  end

  private

  def island_params
    params.require(:island).permit(:name, :description, :price, :location, :image, :address)
  end

  def set_island
    @island = Island.find(params[:id])
  end
end
