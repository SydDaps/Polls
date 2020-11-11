class ApplicationController < ActionController::Base
    helper_method :has_access?, :current_organizer
    
    def current_organizer
        if session[:organizer_id]
            @organizer = Organizer.find(session[:organizer_id])
        end
    end

    def has_access?
        !!current_organizer
    end
    def authorized
        redirect_to new_session_path unless  !!current_organizer
    end
end
