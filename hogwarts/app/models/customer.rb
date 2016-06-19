class Customer < ActiveRecord::Base

  #are nested
  has_many :phones
  has_many :addresses
  has_many :emails
 
  #is not nested
  has_many :credentials

  validates :lastName, :firstName, :gender, :customerRegistrationDate, presence: true

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :emails, allow_destroy: true
end
