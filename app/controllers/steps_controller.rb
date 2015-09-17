class StepsController < ApplicationController
  before_action :set_subject, except: :destroy
  before_action :set_step, only: [:edit, :update, :destroy]

  # GET /steps
  def index
    @steps = @subject.steps
  end

  # GET /steps/1
  # def show
  # end

  # GET /steps/new
  def new
    @step = @subject.steps.build
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps
  def create
    @step = @subject.steps.build(step_params)

    if @step.save
      flash[:notice] = 'Step was successfully created.'
      redirect_to subject_url(@subject)
    else
      flash[:error] = 'Step could not be saved.'
      render :new
    end
  end

  # PATCH/PUT /steps/1
  def update
    if @step.update(step_params)
      flash[:notice] = 'Step was successfully updated.'
      redirect_to subject_steps_url(@subject)
    else
      flash[:error] = 'Step could not be saved.'
      render :edit
    end
  end

  # DELETE /steps/1
  def destroy
    @step.destroy
    flash[:notice] = 'Step was successfully destroyed.'
    redirect_to subject_steps_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_step
    @step = Step.find(params[:id])
  end

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def step_params
    params.require(:step).permit(:title, :detail)
  end
end
