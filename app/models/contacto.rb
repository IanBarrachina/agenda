class Contacto < ActiveRecord::Base
  mount_uploader :foto, ImageUploader
  belongs_to :user
  belongs_to :tipo


  before_save { self.email = email.downcase }
  validates :nombre, presence: true, length: { maximum: 50 }
  validates :apellidos, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :tipo_id, presence: true

end
