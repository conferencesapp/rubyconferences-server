class AnnouncementsController < ApplicationController
  http_basic_authenticate_with(
    name: ENV["ADMIN_USER"],
    password: ENV["ADMIN_PASSWORD"]
  )

  def index
    @pending_announcements = ConferenceAnnouncement.pending
  end

  def send_notification
    @announcement = ConferenceAnnouncement.find(params[:id])

    AnnouncementJob.perform_later(@announcement)

    redirect_to announcements_path
  end
end
