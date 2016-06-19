class User < ApplicationRecord

	has_secure_password

  before_create do |user|
    user.api_token = user.send(:generate_api_token)
  end

  has_many :short_uris


  private

    def generate_api_token
      loop do
        token = SecureRandom.base64.tr('+/=', 'VER')
        if !User.exists?(api_token: token)
          break token
        end
      end
    end

    def downcase_email
      self.email = email.downcase
    end

end
