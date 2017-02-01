class Event < ApplicationRecord
  has_many :products, -> { order :index }

  validates_presence_of :title, :link_name, :keywords

  mount_uploader :image, ProductBannerUploader

  before_save :fiter_keywords

  private
  def fiter_keywords
    self.keywords = self.keywords.delete(' ')
  end
end
