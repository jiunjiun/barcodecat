class Meta < ApplicationRecord
  belongs_to :event, optional: true

  mount_uploader :image, EventMetaImageUploader

  before_save :fiter_keywords

  private
  def fiter_keywords
    self.keywords = self.keywords.delete(' ') if self.keywords.present?
  end
end
