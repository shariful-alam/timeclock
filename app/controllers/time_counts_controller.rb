class TimeCountsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(tracker_id: params[:tracker_id])
    @time_count = @user.time_counts.new
    @time_count.punch_in_time = DateTime.now
    @time_count.active = true
    if @time_count.save
      redirect_to time_count_path(@time_count), notice: 'Time tracking has been started.'
    else
      render :new
    end
  end

  def show

  end

  private

  def time_count_params
    params.permit(:tracker_id)
  end
end
