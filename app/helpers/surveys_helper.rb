module SurveysHelper
  def survey_link(survey)
    "#{root_url}survey_sessions/new/?survey=#{survey.unique_link}"
  end
end
