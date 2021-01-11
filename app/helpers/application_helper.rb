module ApplicationHelper

  def converted_time(dif)
    Time.at(dif).utc.strftime("%H Hours %M Minutes %S seconds")
  end
end
