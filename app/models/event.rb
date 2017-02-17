class Event < ApplicationRecord
  has_many :products, -> { order :index }
  has_one  :meta, dependent: :destroy

  validates_presence_of :title, :link_name

  accepts_nested_attributes_for :meta

  scope :last10, -> { where(enable: true).order(created_at: :desc).last(10) }
end
