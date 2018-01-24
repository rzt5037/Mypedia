class CollaboratorsController < ApplicationController
  def new
    wiki = Wiki.find(params[:wiki_id])
    @collaborator = wiki.collaborators.new
  end

  def create
    wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find_or_initialize_by(collaborator_params)

    if @collaborator.save
      flash[:notice] = "Collaborator was added successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "Error saving collaborator. Please try again."
      render :new
    end
  end

  def destroy
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end
end
