# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = Settings.host

SitemapGenerator::Sitemap.create do
  Event.where(enable: true).each do |evnet|
    add event_path(evnet.link_name), priority: 1.0, changefreq: 'always', lastmod => evnet.updated_at
  end
end
