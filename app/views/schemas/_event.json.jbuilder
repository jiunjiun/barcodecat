json.set! :@context, 'http://schema.org/'
json.set! :@type, 'product'
json.url event_url(event.link_name)
json.brand I18n.t('title')
json.logo asset_url('logos/logo@144.jpg')
json.name event.title
# json.category
json.image event.meta.image.url
json.description event.meta.desc
json.aggregateRating do
  json.set! :@type, 'AggregateRating'
  json.ratingValue "4.7"
  json.reviewCount "496"
end
json.offers do
  json.set! :@type, 'AggregateOffer'
  json.priceCurrency "TWD"
  json.lowPrice "100"
  json.highPrice "2000"
end
