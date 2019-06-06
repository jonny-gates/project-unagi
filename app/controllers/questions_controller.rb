class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @survey = Survey.find(params[:survey_id])
    @question.survey = @survey
    if @question.save
      redirect_to survey_path(@survey)
    else
      flash[:alert] = 'Sorry, there was an error. Please try again!'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = 'Question deleted!'
    else
      flash[:alert] = 'There was an error deleting the question. Please try again!'
    end
    redirect_back(fallback_location: root_path)
  end

  private
  def question_params
    params.require(:question).permit(:title)
  end
end
