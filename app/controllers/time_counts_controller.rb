class TimeCountsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(tracker_id: params[:tracker_id])
    if @user.present?
      if params[:commit] === 'Punch In'
        @time_count = @user.time_counts.new
        @time_count.punch_in_time = DateTime.now
        @time_count.active = true
        if @time_count.save
          redirect_to time_count_path(@time_count), notice: 'Time tracking has been started.'
        else
          render :new
        end
      elsif params[:commit] === 'Punch Out'
        @time_count = @user.time_counts.find_by(active: true)
        total_time = ((DateTime.now - @time_count.punch_in_time.to_datetime) * 24 * 60 * 60).to_i
        if @time_count.update(punch_out_time: DateTime.now, total_time: total_time, active: false)
          redirect_to time_count_path(@time_count), notice: 'Time tracking has been ended.'
        else
          render :new
        end
      end
    else
      redirect_to new_time_count_path, alert: 'Worker not found!!'
    end
  end

  def show
    @time_count = TimeCount.find(params[:id])
  end

  private

  def time_count_params
    params.permit(:tracker_id)
  end
end