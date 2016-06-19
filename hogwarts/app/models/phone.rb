class Phone < ActiveRecord::Base

  belongs_to :customer
  #accepts_nested_attributes_for :customer
  validates :customer_id, presence: true
  #attr_accessible :customer_id, firstName
end