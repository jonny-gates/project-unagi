class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :results, :destroy]

  def index
    @surveys = Survey.where(user: current_user)
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(surveys_params)
    @survey.user = current_user
    @survey.unique_link = SecureRandom.urlsafe_base64(nil, false)
    if @survey.save
      redirect_to survey_path(@survey)
    else
      render :new
    end
  end

  def show
    @question = Question.new
  end

  def results
  end

  def destroy
    if @survey.destroy
      flash[:notice] = 'Survey deleted!'
      redirect_to surveys_path
    else
      flash[:alert] = 'There was an error deleting the survey. Please try again!'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def surveys_params
    params.require(:survey).permit(:title)
  end

  def set_survey
    @survey = Survey.find(params[:id])
  end
end
