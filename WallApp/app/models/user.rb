class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include ActiveModel::SecurePassword
  include Mongoid::Paperclip

  field :Name, type: String
  field :Age, type: Integer
  field :Address, type: String
  field :Phone, type: String
  field :UserName, type: String

  field :password_digest, type: String

  has_secure_password

  has_mongoid_attached_file :image, validate_media_type: false   
  validates_attachment :image, :presence => true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  do_not_validate_attachment_file_type :image
end
