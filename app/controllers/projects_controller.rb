class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by_key(params[:id])
    puts @project.versions
    puts @project.languages
  end

end
