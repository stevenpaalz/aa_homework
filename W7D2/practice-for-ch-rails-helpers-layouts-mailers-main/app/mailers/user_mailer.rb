class UserMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        @url = 'http://localhost:3000/session/new'
        mail(to: user.username, subject: 'Welcome to 99Cats!')
    end
end
