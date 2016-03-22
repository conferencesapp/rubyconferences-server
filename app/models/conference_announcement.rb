class ConferenceAnnouncement < ActiveRecord::Base
  belongs_to :conference

  validates :conference_id, :body, presence: true
end
