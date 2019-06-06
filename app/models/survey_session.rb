class SurveySession < ApplicationRecord
  belongs_to :survey
  has_many :survey_responses, dependent: :destroy

  def completion_perc
    SurveyResponse.where(survey_session: self).count / Question.where(survey: self.survey).count.to_f * 100
  end
end
