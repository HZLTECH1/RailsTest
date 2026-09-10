class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new
  end
  def show
    @project = Project.find(params[:id])
  end
  def create
    @project = Project.create(name: project_params[:name])
    redirect_to action: "index"
  end
  def edit
    @project = Project.find(params[:id])
  end
  def update
    @project = Project.find(params[:id])
    @project.name = project_params[:name]
    @project.save
    flash[:status] = "Project Updated Succesfully"
    redirect_to action: "index"
  end
  def delete
    @project = Project.find(params[:id])
    @project.destroy
    flash[:delete_status] = "Project deleted Succesfully"
    redirect_to action: "index"
  end
  private
  def project_params
    params.require(:project).permit(:name)
  end
end
