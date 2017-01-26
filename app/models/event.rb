class Event < ApplicationRecord
  has_many :products

  validates_presence_of :title, :url_name
end
