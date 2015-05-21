class Announcement < ActiveRecord::Base
  validates :body, presence: true
end
