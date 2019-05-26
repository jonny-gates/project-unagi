class SurveysController < ApplicationController
  before_action :set_survey, only: :show

  def index
    @surveys = Survey.where(user: current_user)
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(surveys_params)
    @survey.user = current_user
    if @survey.save
      redirect_to survey_path(@survey)
    else
      render :new
    end
  end

  def show
    @question = Question.new
  end

  private

  def surveys_params
    params.require(:survey).permit(:title)
  end

  def set_survey
    @survey = Survey.find(params[:id])
  end
end
