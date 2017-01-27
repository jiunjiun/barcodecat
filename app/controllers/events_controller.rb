class EventsController < ApplicationController
  layout 'paralax'

  expose :event, -> { find_event }

  def show
  end

  private
  def find_event
    Event.find_by_link_name(params[:link_name]) || Event.last
  rescue
    Event.last
  end
end
