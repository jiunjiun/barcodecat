class Product < ApplicationRecord
  belongs_to :event

  validates_presence_of :name, :url

  mount_uploader :banner, ProductBannerUploader

  before_create :update_index

  private
  def update_index
    self.index = self.event.products.size
  end
end
