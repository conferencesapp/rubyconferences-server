class DateFormatter
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def to_s
    if same_date?
      simple
    else
      formatted
    end
  end

  private

  attr_reader :start_date, :end_date

  def simple
    "#{start_date_text}, #{start_date_year_text}"
  end

  def formatted
    if start_date_year_text == end_date_year_text
      if start_date_month_text == end_date_month_text
        "#{start_date_text}-#{end_date_date_text}, #{end_date_year_text}"
      else
        "#{start_date_text} - #{end_date_month_text}"\
          " #{end_date_date_text}, #{end_date_year_text}"
      end
    else
      "#{start_date_text}, #{start_date_year_text} -"\
        " #{end_date_month_text} #{end_date_date_text}, #{end_date_year_text}"
    end
  end

  def same_date?
    start_date == end_date
  end

  def start_date_text
    @start_date_date_text ||= "#{start_date_month_text} #{start_date_date_text}"
  end

  def start_date_month_text
    @start_date_month_text ||= month_text(start_date)
  end

  def start_date_date_text
    @start_date_date_text ||= date_text(start_date)
  end

  def start_date_year_text
    @start_date_year_text ||= year_text(start_date)
  end

  def end_date_month_text
    @end_date_month_text ||= month_text(end_date)
  end

  def end_date_date_text
    @end_date_date_text ||= date_text(end_date)
  end

  def end_date_year_text
    @end_date_year_text ||= year_text(end_date)
  end

  def date_text(date)
    date.strftime("%d")
  end

  def month_text(date)
    date.strftime("%B")
  end

  def year_text(date)
    date.strftime("%Y")
  end
end
