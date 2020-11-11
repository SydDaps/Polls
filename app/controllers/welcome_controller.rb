class WelcomeController < ApplicationController
  def index
    if has_access?
      redirect_to new_poll_path
    end
  end
end
