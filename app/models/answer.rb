class Answer < ApplicationRecord
  belongs_to :question
  has_many :survey_responses
  validates :title, presence: true
end
