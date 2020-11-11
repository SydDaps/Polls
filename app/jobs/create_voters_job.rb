class CreateVotersJob < ApplicationJob
  queue_as :default

  def perform(param_hash)
    @poll = param_hash[:poll]
    
    param_hash[:emails].each do |mail|
      @voter = @poll.voters.build(email: mail[:email])
      next if Voter.find_by(poll_id: @poll.id, email: mail[:email])
      @voter.save
      VotersMailer.new_voter_email(@poll, @voter).deliver_now
    end
    
  end
end
