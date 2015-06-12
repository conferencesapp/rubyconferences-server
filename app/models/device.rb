class Device < ActiveRecord::Base
  validates :token, presence: true, uniqueness: { scope: :conference_type }

  enum conference_type: [:ruby, :js]
end
