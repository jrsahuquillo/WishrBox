class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wishes


  #Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
