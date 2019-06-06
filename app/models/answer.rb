class Answer < ApplicationRecord
  belongs_to :question
  has_many :survey_responses, dependent: :destroy
  validates :title, presence: true
end
