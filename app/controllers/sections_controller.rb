class SectionsController < ApplicationController
  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to poll_path(@section.poll)
    end
  end



  private
  def section_params
    params.require(:section).permit(:description, :poll_id, options_attributes: [:id, :title, :_destroy])
  end
end
