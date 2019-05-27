class SurveyResponse < ApplicationRecord
  belongs_to :survey_session
  belongs_to :answer
end
