class VotesController < ApplicationController
  def index
    @poll = Poll.find(params[:poll_id])
    @results = {}
    @results[:section] = {}

    @poll.sections.each_with_index do |section, i|

      @results[:section]["#{i+1}. #{section.description}"] = {
        total_section_votes: section.votes.count.to_f
      }
      @results[:section]["#{i+1}. #{section.description}"][:options] = {}
      temp_opt = []
      section.options.each do |option|
        @results[:section]["#{i+1}. #{section.description}"][:options][option.title] = option.votes.count.to_f
        temp_opt << option.votes.count.to_f
        
      end
      
      @results[:section]["#{i+1}. #{section.description}"][:max_vote] = temp_opt.max
      
    end
    
    
    
  end

  def new
    
    @vote = Vote.new()
    @voter = Voter.find(params[:voter_id])
    @poll = @voter.poll
    unless @voter.voted_at 
      @sections = @poll.sections
    else
      redirect_to poll_votes_path(@voter.poll)
    end

    
    

  end

  def create

    @voter = Voter.find(params[:voter_id])
    total_sections = @voter.poll.sections.count
    
    if votes_param[:option_id].count == total_sections
      votes_param[:option_id].each do |opt_sec_poll_id|
        opt_sec_poll_id = opt_sec_poll_id.split('|')
        @vote = @voter.votes.build(
          option_id: opt_sec_poll_id[0], 
          section_id: opt_sec_poll_id[1],
          poll_id: opt_sec_poll_id[2]
          )
        @vote.save
        puts @vote.inspect
      end
      @voter.update(voted_at: Time.current);
      redirect_to poll_votes_path(@voter.poll)
    else
      flash[:error] = "please vote for all sections"
      redirect_to new_voter_vote_path(@voterPol)
    end
    
  end


  private

  def votes_param
    return params.require(:vote).permit(option_id: []) if params[:vote].present?
    {option_id: []}
  end
end
