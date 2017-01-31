class HomeController < ApplicationController

  expose :events, -> { Event.where(enable: true).order(created_at: :desc) }

  def index
  end
end
