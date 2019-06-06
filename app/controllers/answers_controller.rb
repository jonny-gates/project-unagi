class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to survey_path(@question.survey)
    else
      flash[:alert] = 'There was an error saving the question. Please try again'
      redirect_to survey_path(@question.survey)
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    if @answer.destroy
      flash[:notice] = 'Answer deleted'
    else
      flash[:alert] = 'Sorry there was an error. Please try again!'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def answer_params
    params.require(:answer).permit(:title)
  end

end
