class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :api_token, :password_digest
end
