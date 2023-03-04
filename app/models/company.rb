class Company < ApplicationRecord
  belongs_to :user

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  validates_presence_of :name, :title, :department
  validates_associated :address
end
