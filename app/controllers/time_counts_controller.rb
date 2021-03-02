class TimeCountsController < ApplicationController

  before_action :check_session

  def new
    if @is_active
      @user = User.find_by(tracker_id: session[:tracker_id])
      @time_count = @user.time_counts.last
      @total_time_worked = @time_count.user.time_counts.sum(:total_time)
    end
  end

  def create
    @user = User.find_by(tracker_id: params[:tracker_id])
    if @user.present?
      if params[:commit] === 'Punch In'
        @time_count = @user.time_counts.new
        @time_count.punch_in_time = DateTime.now
        @time_count.active = true
        if @time_count.save
          session[:tracker_id] = params[:tracker_id]
          redirect_to new_time_count_path, notice: 'Time tracking has been started.'
        else
          render :new
        end
      elsif params[:commit] === 'Punch Out'
        @time_count = @user.time_counts.last
        total_time = ((DateTime.now - @time_count.punch_in_time.to_datetime) * 24 * 60 * 60).to_i
        if @time_count.update(punch_out_time: DateTime.now, total_time: total_time, active: false)
          session.delete(:tracker_id)
          redirect_to new_time_count_path, notice: 'Time tracking has been ended.'
        else
          render :new
        end
      elsif params[:commit] === 'See Log'
        redirect_to time_count_path(@user.time_counts.last)
      end
    else
      redirect_to new_time_count_path, alert: 'Worker not found!!'
    end
  end

  def show
    @time_count = TimeCount.find(params[:id])
    @total_time_worked = @time_count.user.time_counts.sum(:total_time)
  end

  def see_log
  end

  private

  def time_count_params
    params.permit(:tracker_id)
  end

  def check_session
    if session[:tracker_id].present?
      @is_active = true
    else
      @is_active = false
    end
  end

end
