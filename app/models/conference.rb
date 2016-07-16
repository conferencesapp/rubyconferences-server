class Conference < ActiveRecord::Base
  acts_as_taggable

  geocoded_by :location

  mount_uploader :logo, LogoUploader

  with_options if: :active? do |object|
    object.validates :website, presence: true
    object.validates :image_url, presence: true
    object.validates :location, presence: true
    object.validates :start_date, presence: true
    object.validates :end_date, presence: true
  end

  validates :name, presence: true
  validates :twitter_username, presence: true

  after_update :create_geocode_and_tag_list

  scope :active, -> { where(active: true) }

  def self.upcoming
    active.where("start_date >= ?", Date.today).order("start_date")
  end

  # Specific bug in iOS version 1.2 with deleting old conferences from list
  def self.v2_conferences
    where("start_date >= ?", Date.parse("14 Oct 2015")).order("start_date")
  end

  def self.past
    active.where("start_date < ?", Date.today).order("start_date DESC")
  end

  def when
    DateFormatter.new(start_date, end_date).to_s
  end

  def cfp_status
    if cfp_end_at
      if cfp_end_at > Time.now
        "CFP is open till #{pretty_cfp_end_at}"
      else
        "CFP has been closed on #{pretty_cfp_end_at}"
      end
    else
      "CFP date is unknown"
    end
  end

  def logos
    {
      thumb: logo.thumb.url,
      logo: logo.logo.url,
      original: logo.url
    }
  end

  private

  def pretty_cfp_end_at
    cfp_end_at.strftime("%d %b %Y")
  end

  def create_geocode_and_tag_list
    if active?
      geocode
      self.tag_list << "ruby"
    end
  end
end
