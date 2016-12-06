class Wish < ApplicationRecord

  belongs_to :user

  #Validations
  validates :title, presence:true

end
