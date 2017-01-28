class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :prepare_meta_tags

  private
  def prepare_meta_tags opts={}
    title       = I18n.t('title')
    site        = opts[:site] || ''
    description = opts[:description]
    keywords    = opts[:keywords]

    defaults = {
      #Share
      title: title,
      site: site,
      description: description,
      keywords: keywords,

      #Facebook
      og: {
        title: site.present? ? "#{site} | #{title}" : title,
        description: description,
        url: request.original_url,
        site_name: title,
        type: opts[:type]   || 'website',
        # image: opts[:image] || "#{request.base_url}/vidol_fb_kv.png"
      }
    }

    set_meta_tags defaults
  end
end
