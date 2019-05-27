class CreateSurveyResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_responses do |t|
      t.references :survey_session, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
