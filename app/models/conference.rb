class Conference < ActiveRecord::Base
  acts_as_taggable

  validates :name, presence: true
  validates :location, presence: true
  validates :twitter_username, presence: true
  validates :image_url, presence: true
  validates :website, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def self.upcoming
    where("start_date >= ?", Date.today).order("start_date")
  end

  def self.past
    where("start_date < ?", Date.today).order("start_date DESC")
  end

  def when
    DateFormatter.new(start_date, end_date).to_s
  end
end
