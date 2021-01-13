module ApplicationHelper

  def converted_time(dif)
    Time.at(dif).utc.strftime("%H Hours %M Minutes")
  end

  def full_date(datetime)
    datetime.strftime('%d %B, %Y')
  end
end
