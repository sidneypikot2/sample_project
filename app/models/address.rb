class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates_presence_of :lat, :lng, :city, :state, :address, :postal_code
end
