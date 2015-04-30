class Conference < ActiveRecord::Base
  validates :end_date, presence: true
  validates :image_url, presence: true
  validates :location, presence: true
  validates :name, presence: true
  validates :start_date, presence: true
  validates :twitter_username, presence: true
  validates :website, presence: true

  def self.upcoming
    where("start_date >= ?", Date.today).order("start_date")
  end

  def when
    if start_date == end_date
      start_date.strftime('%B %d %Y')
    else
      formatted_when
    end
  end

  private

  def formatted_when
    month_text = start_date.strftime('%B')
    start_date_text = start_date.strftime('%d')
    end_date_text = end_date.strftime('%d')
    year_text = end_date.strftime('%Y')

    "#{month_text} #{start_date_text}-#{end_date_text} #{year_text}"
  end
end
