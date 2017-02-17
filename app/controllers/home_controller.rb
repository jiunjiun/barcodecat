class HomeController < ApplicationController
  expose :events, -> { Event.last10 }

  before_action :update_meta_tags

  def index; end

  private

  def update_meta_tags
    meta_tags_option = {
      title: "#{I18n.t('title')} - #{I18n.t('meta.keywords')}",
      description: I18n.t('meta.desc'),
      keywords: I18n.t('meta.keywords'),
      # image: ,
    }

    prepare_meta_tags meta_tags_option
  end
end
