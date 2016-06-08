class CaloriesBoundsController < ApplicationController
  def edit
    @calories_bound = User.find(params[:user_id]).calories_bound
    if @calories_bound.user_id != current_user.id then
      raise ActiveRecord::RecordNotFound.new(params[:user_id])
    end
  end

  def create
    update
  end

  def update
    @calories_bound = User.find(params[:user_id]).calories_bound
    if @calories_bound.user_id != current_user.id then
      raise ActiveRecord::RecordNotFound.new(params[:user_id])
    end
    @calories_bound.upper_bound = calories_bound_params[:upper_bound]
    @calories_bound.save!
    redirect_to diaries_path(current_user), notice: 'Your calorie goal has been updated.'
  rescue ActiveRecord::RecordInvalid => err
    render :edit
  end 

  private
  def calories_bound_params
    params.require(:calories_bound).permit(:upper_bound)
  end
end
