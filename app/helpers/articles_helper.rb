module ArticlesHelper
  def day_change?(time)
    @current_day != time.to_date
  end

  def show_day(time)
    @current_day = time.to_date
    if @current_day == Time.zone.today
      "TODAY"
    elsif @current_day == Time.zone.yesterday
      "YESTERDAY"
    else
      @current_day.to_s
    end
  end
end
