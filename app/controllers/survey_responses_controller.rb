class SurveyResponsesController < ApplicationController
  def answer
    @survey_session = SurveySession.find(params[:id])
    @answer = Answer.find(params[:answer_id])
    @survey_response = SurveyResponse.get_by_question(@survey_session, @answer.question)
    if @survey_response
      @survey_response.assign_attributes(answer: @answer)
    else
      @survey_response = SurveyResponse.new(survey_session: @survey_session, answer: @answer)
    end


    if @survey_response.save
      @completion_perc = @survey_session.completion_perc
      respond_to do |format|
        format.html {
          redirect_back(fallback_location: root_path)
          flash[:warning] = "Sorry! This app requires javacript being enabled to work!"
        }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html {
          redirect_back(fallback_location: root_path)
          flash[:warning] = "Sorry! This app requires javacript being enabled to work!"
        }
        format.js  # <-- idem
      end
    end

  end
end
