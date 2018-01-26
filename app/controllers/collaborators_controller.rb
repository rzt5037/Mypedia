class CollaboratorsController < ApplicationController
  def new
    wiki = Wiki.find(params[:wiki_id])
    @collaborator = wiki.collaborators.new
  end

  def create
    @collaborator = Collaborator.find_or_initialize_by(collaborator_params)
    @wiki = Wiki.find(@collaborator.wiki_id)
    @user = User.find(@collaborator.user_id)

    if @collaborator.save
      flash[:notice] = "\"#{@user.email}\" was added successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error saving collaborator. Please try again."
      render :new
    end
  end

  def destroy
    @collaborator = Collaborator.where(wiki_id: params[:wiki_id], user_id: params[:id]).first
    @wiki = Wiki.find(@collaborator.wiki_id)
    @user = User.find(@collaborator.user_id)

    if @collaborator.destroy
      flash[:notice] = "\"#{@user.email}\" was deleted successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :new
    end
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end
end
