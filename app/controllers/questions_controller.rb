class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @survey = Survey.find(params[:survey_id])
    @question.survey = @survey
    if @question.save
      redirect_to survey_path(@survey)
    else
      flash[:notice] = 'Sorry, there was an error. Please try again!'
      redirect_back(fallback_path: root_path)
    end
  end

  private
  def question_params
    params.require(:question).permit(:title)
  end
end
