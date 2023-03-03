class User < ApplicationRecord
  include Presentable
  has_one :bank, dependent: :destroy
  has_one :company, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :bank
  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :address

  validates_presence_of :bank
end
