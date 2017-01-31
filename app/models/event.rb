class Event < ApplicationRecord
  has_many :products, -> { order :index }

  validates_presence_of :title, :link_name, :keywords

  mount_uploader :image, ProductBannerUploader
end
