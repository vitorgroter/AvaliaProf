class SubjectsController < ApplicationController
  def index
    @title = "Materias"
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
    @title = @subject.code
    @subcomments = @subject.subcomments
    if signed_in?
      @subcomment = Subcomment.new
      @subcomment.subject = @subject
    end
  end
end
