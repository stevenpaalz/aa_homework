class User < ApplicationRecord

    attr_reader :password

    validates :username, :session_token, presence: true
    validates :password_digest, presence: {message: "Password can't be blank"}
    validates :password, length: { minimum: 6, allow_nil: true}
    before_validation :ensure_session_token

    def self.find_by_credentials(username, password)
        # debugger
        user = User.find_by('username = ?', username)
        return user if user.is_password?(password)
        nil
    end

    def generate_unique_session_token
        SecureRandom.urlsafe_base64
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = generate_unique_session_token
    end

    def ensure_session_token
        if self.session_token.nil?
            reset_session_token!
        end
    end
end
