class OrganizerMailer < ApplicationMailer
    def access_token_email(organizer)
        @organizer = organizer
        mail(to: @organizer.email , subject: "Polls access token")
    end
end
