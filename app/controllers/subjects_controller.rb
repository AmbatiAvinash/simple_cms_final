class SubjectsController < ApplicationController
  
 
  layout false

  def index
    @subjects = Subject.sorted
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to(:action => 'index')
    else
      render('new')
    end

  end

  def show
    @subject = Subject.find_by_id(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def delete
    @subject = Subject.find(params[:id])
    if @subject.destroy
      redirect_to(:action => 'index')
    else
      redirect_to(:action => 'index')
    end 
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end


end
