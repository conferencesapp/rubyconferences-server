class DateFormatter
  delegate :day, :month, :year, to: :start_date_text, prefix: true
  delegate :day, :month, :year, to: :end_date_text, prefix: true

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
    "#{combined_start_date_text}, #{start_date_text_year}"
  end

  def formatted
    if start_date_text_year == end_date_text_year
      format_with_same_year
    else
      format_with_differnet_year
    end
  end

  def format_with_differnet_year
    "#{combined_start_date_text}, #{start_date_text_year} -"\
      " #{end_date_text_month} #{end_date_text_day}, #{end_date_text_year}"
  end

  def format_with_same_year
    if start_date_text_month == end_date_text_month
      "#{combined_start_date_text}-#{end_date_text_day}, #{end_date_text_year}"
    else
      "#{combined_start_date_text} - #{end_date_text_month}"\
        " #{end_date_text_day}, #{end_date_text_year}"
    end
  end

  def same_date?
    start_date == end_date
  end

  def combined_start_date_text
    "#{start_date_text_month} #{start_date_text_day}"
  end

  def start_date_text
    @start_date_text ||= DateText.new(start_date)
  end

  def end_date_text
    @end_date_text ||= DateText.new(end_date)
  end

  class DateText
    def initialize(date)
      @date = date
    end

    def day
      date.strftime("%d")
    end

    def month
      date.strftime("%B")
    end

    def year
      date.year
    end

    private

    attr_reader :date
  end
end
