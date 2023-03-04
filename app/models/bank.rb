class Bank < ApplicationRecord
  belongs_to :user

  validates_presence_of :iban, :currency, :card_type, :card_expire, :card_number
end
