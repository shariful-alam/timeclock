module ApplicationHelper

  def converted_time(dif)
    Time.at(dif).utc.strftime("%H:%M:%S")
  end
end
