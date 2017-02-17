class EventsController < ApplicationController
  layout 'paralax'

  expose :events, -> { Event.last10 }
  expose :event, -> { find_event }

  before_action :verify_event
  before_action :update_meta_tags

  def show; end

  private

  def find_event
    link_name = params[:link_name]
    _event = Event.where(link_name: link_name)
    _event = _event.where(enable: true) unless admin_signed_in?

    _event.last
  end

  def verify_event
    redirect_to(event_path(Event.where(enable: true).last.link_name)) && return if event.blank?
  rescue
    redirect_to root_path
  end

  def update_meta_tags
    meta_tags_option = {
      site: event.title,
      description: event.meta.desc,
      keywords: event.meta.keywords,
      image: event.meta.image
    }

    prepare_meta_tags meta_tags_option
  end
end
