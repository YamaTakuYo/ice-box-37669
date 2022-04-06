class RefrigeratorsController < ApplicationController
  before_action :set_refrigerator, only: [:show, :edit, :update, :destroy]

  def index
    @refrigerator = Refrigerator.all
    @refrigerators = Refrigerator.all
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
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

  def destroy
    @refrigerator.destroy
    redirect_to new_refrigerator_path
  end

  private

  def refrigerator_params
    params.require(:refrigerator).permit(:food, :ex_date, :remarks, :category_id).merge(user_id: current_user.id)
  end

  def set_refrigerator
    @refrigerator = Refrigerator.includes(:user).find(params[:id])
  end
end
