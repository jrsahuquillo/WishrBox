class Wish < ApplicationRecord

  belongs_to :user

  #Validations
  validates :title, presence:true
  validates_format_of :link, with: URI::regexp(%w(http https)), allow_blank:true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing_wish.png"
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/



end
