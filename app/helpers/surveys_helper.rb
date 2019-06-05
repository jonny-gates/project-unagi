module SurveysHelper
  def survey_link(survey)
    "#{root_url}?survey=#{survey.unique_link}"
  end
end
