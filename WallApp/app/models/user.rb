class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include ActiveModel::SecurePassword

  field :Name, type: String
  field :Age, type: Integer
  field :Address, type: String
  field :Phone, type: String
  field :UserName, type: String

  field :password_digest, type: String

  has_secure_password
end
