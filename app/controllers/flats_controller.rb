class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_flat, only: [:show, :update, :edit, :destroy]

  def index 
    @flats = Flat.all
  end
  
  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.owner = current_user
    if @flat.save
      flash[:success] = "Flat successfully created"
      redirect_to @flat
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def edit
  end

  def update
   if @flat.update(flat_params)
      flash[:success] = "Flat successfully created"
      redirect_to @flat
    else
      flash[:error] = "Something went wrong"
      render 'new'
   end
  end
  
  
  
  private

  def flat_params
    params.require(:flat).permit(:address, :name)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
