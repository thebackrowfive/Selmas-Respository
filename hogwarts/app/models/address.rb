class Address < ActiveRecord::Base
  
  belongs_to :customer

  validates :streetNumber, :streetName, :city, :provinceOrState, :postalCode, presence: true


end
