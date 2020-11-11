# Preview all emails at http://localhost:3000/rails/mailers/organizer_mailer
class OrganizerMailerPreview < ActionMailer::Preview
    def access_token_email
        @organizer = Organizer.new(name: "syd", email: "ss@gmail.com", access_token: "kkk-jjjj--kkkk")
        OrganizerMailer.access_token_email(@organizer)   
    end
end
