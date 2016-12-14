class PagesController < ApplicationController

  before_action :authorize, except: [:landing]

  def landing
  end

  def home
    @issues_recent = Issue.all.reverse
    @issues_oldest = Issue.all
    @announcements = Announcement.all
  end

end
