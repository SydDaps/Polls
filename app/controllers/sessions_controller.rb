class SessionsController < ApplicationController

    def new
        if has_access?
            redirect_to polls_path
        end
        @organizer = Organizer.new
    end

    def create 
        @organizer = Organizer.find_by(access_token: organizer_params[:access_token])
        if @organizer 
            session[:organizer_id] = @organizer.id
            redirect_to new_poll_path
        else
            flash[:error] = "Please enter correct access_token"
            render "new"
        end
    end

    def destroy
        session[:organizer_id] = nil
        redirect_to root_path
    end


    private
    def organizer_params
        params.require(:organizer).permit(:access_token)
    end
end
