class OrganizersController < ApplicationController
  def new
    if has_access?
      redirect_to polls_path
    end
    @organizer = Organizer.new
  end

  def create
    if Organizer.find_by(email: organizer_params[:email])
      flash[:info] = "Organizer already registered enter access key to continue"
      redirect_to new_session_path
    else
      @organizer = Organizer.new(organizer_params)

      if @organizer.save
        flash[:success] = "Access token has been sent to mail"
        session[:organizer_id] = @organizer.id
        OrganizerMailer.access_token_email(@organizer).deliver_now
        redirect_to new_poll_path
      else
        render "new"
      end
    end
  end

  private
  def organizer_params
    params.require(:organizer).permit(:name, :email)
  end
end
