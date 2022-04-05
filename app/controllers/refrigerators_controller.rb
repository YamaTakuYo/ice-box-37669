class RefrigeratorsController < ApplicationController
  before_action :set_refrigerator, only: [:show, :edit, :update, :destroy]
  
  def index
    @refrigerator = Refrigerator.all
  end
  
  def new
    @refrigerator = Refrigerator.new
    @refrigerators = Refrigerator.all
  end

  def create
    @refrigerator = Refrigerator.new(refrigerator_params)
    if @refrigerator.save
      redirect_to new_refrigerator_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  private

  def refrigerator_params
    params.require(:refrigerator).permit(:food, :ex_date, :remarks, :category_id).merge(user_id: current_user.id)
  end

  def set_refrigerator
    @refrigerator = Refrigerator.find(params[:id])
  end

end
