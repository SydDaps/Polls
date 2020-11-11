class VotersMailer < ApplicationMailer
    def new_voter_email(poll, voter)
        @poll = poll
        @voter = voter
        mail(to: @voter.email , subject: "Poll Voting link")
    end
end
