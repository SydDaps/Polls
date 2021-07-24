class PollsController < ApplicationController
  before_action :authorized
  
  def index
    @polls = current_organizer.polls
  end

  def new
    @poll = Poll.new
    @sections = @poll.sections.new
  end

  def create
    @poll = current_organizer.polls.build(poll_params)
    if @poll.save
      redirect_to poll_path(@poll)
    else      
      render json: @poll.errors, status: :unprocessable_entity
    end

  end

  def show
    @poll = Poll.find(params[:id])
    
    unless @poll.start_at 
      @section = @poll.sections.new
      @option = @section.options.new
      @sections = @poll.sections.all
    else
      redirect_to poll_votes_path(@poll)
    end
  end

  def update 
    @poll = Poll.find(params[:id])
    @poll.voters_csv.attach(update_params[:voters_csv])
    if @poll.update(update_params) 
      # 
      @poll.voters_csv.open do |file|
        @emails = SmarterCSV.process(file)
      end
      
      CreateVotersJob.perform_later(poll: @poll, emails: @emails)
      puts "---------"
      puts @emails
      redirect_to @poll
    else
      redirect_to poll_path(@poll)
    end
  end



  private
  def poll_params
    params.require(:poll).permit(:title, :description, sections_attributes: [:id, :description])
  end

  def update_params
    params.require(:poll).permit(:start_at, :end_at, :voters_csv)
  end

end
