class PagesController < ApplicationController

  before_action :authorize, except: [:landing]

  def landing
  end

  def home
    @issues = Issue.all.reverse
    @announcements = Announcement.all
  end
end
