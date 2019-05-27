class CreateSurveySessions < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_sessions do |t|
      t.references :survey, foreign_key: true
      t.string :participant_name
      t.datetime :completed_at

      t.timestamps
    end
  end
end
