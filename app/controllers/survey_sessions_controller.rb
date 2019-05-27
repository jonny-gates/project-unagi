class SurveySessionsController < ApplicationController
  def new
    @survey = Survey.find_by(unique_link: params[:survey])
    unless @survey_session = SurveySession.create(survey: @survey)
      flash[:warning] = 'There was an error. Please try again!'
      redirect_to root_path
    end
  end
end
