class WelcomeController < ApplicationController
  def index
    if has_access?
      redirect_to polls_path
    end
  end
end
