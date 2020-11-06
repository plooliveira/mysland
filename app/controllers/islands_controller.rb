class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_island, only: [:show, :update, :destroy]

  def index
    @islands = Island.all

  end

  def show
    @island = Island.find(params[:id])
    @reservation = Reservation.new
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
  end

  private

  def island_params
    params.require(:island).permit(:name, :description, :price, :location)
  end

  def set_island
    @island = Island.find(params[:id])
  end
end
