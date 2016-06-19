class Email < ActiveRecord::Base

belongs_to :customer

validates :emailType , :email , :presence => true


end
