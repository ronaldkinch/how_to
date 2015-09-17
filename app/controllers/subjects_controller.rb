class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  def show
    @steps = Step.where(subject_id: @subject)
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] = 'Subject was successfully created.'
      redirect_to @subject
    else
      flash[:error] = 'Subject could not be saved.'
      render :new
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      flash[:notice] = 'Subject was successfully updated.'
      redirect_to @subject
    else
      flash[:error] = 'Subject could not be saved.'
      render :edit
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
    flash[:notice] = 'Subject was successfully destroyed.'
    redirect_to subjects_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subject_params
    params.require(:subject).permit(:name, :description)
  end
end
