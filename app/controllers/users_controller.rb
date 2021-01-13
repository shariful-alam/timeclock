class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'Registration Complete.'
    else
      render :new
    end
  end

  def show
  end

  def track_user
    user = User.find_by(tracker_id: params[:tracker_id])
    if user.present?
      time_count = user.time_counts.find_by(active: true)
      if time_count.present?
        render json: { success: true }
      else
        render json: { success: false }
      end
    else
      render json: { success: false }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :date_of_birth)
  end
end
