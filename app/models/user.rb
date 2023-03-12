class User < ApplicationRecord
  include Presentable
  include UserImageUploader::Attachment(:image)

  has_one :bank, dependent: :destroy
  has_one :company, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :bank
  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :address

  validates_presence_of :first_name, :maiden_name, :last_name, :birth_date,
                        :gender, :university, :email, :phone, :username,
                        :height, :weight, :eye_color, :hair_type, :hair_color
  validates_presence_of :password, on: :create
  validates_associated :bank, :company, :address

  validates :email, uniqueness: true
end
