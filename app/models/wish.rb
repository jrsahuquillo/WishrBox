class Wish < ApplicationRecord

  belongs_to :user

  #Validations
  validates :title, presence:true
  validates_format_of :link, with: URI::regexp(%w(http https)), allow_blank:true

end
