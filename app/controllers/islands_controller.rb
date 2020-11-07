class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_island, only: [:show, :update, :destroy]

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
      puts 'aquiiiiii'
      redirect_to islands_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if current_user == @island.user
      @island.destroy
      redirect_to dashboard_path
    end
  end

  def dashboard
    @islands = current_user.islands
  end

  private

  def island_params
    params.require(:island).permit(:name, :description, :price, :location, :image, :address)
  end

  def set_island
    @island = Island.find(params[:id])
  end
end
