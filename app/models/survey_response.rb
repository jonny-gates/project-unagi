class SurveyResponse < ApplicationRecord
  belongs_to :survey_session
  belongs_to :answer

  def self.get_by_question(survey_session, question)
    SurveyResponse.where(survey_session: survey_session).select { |response| response.answer.question == question }.first
  end
end
