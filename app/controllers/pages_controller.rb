class PagesController < ApplicationController
  def landing
  end

  def home
    @issues = Issue.all
  end
end
