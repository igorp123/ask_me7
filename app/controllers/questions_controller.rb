class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit]

  def create
    question = Question.create(questions_params)

    redirect_to question_path(question), notice: 'Новый вопрос создан.'
  end

  def update
    @question.update(questions_params)

    redirect_to question_path(@question), notice: 'Вопрос сохранен.'
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Вопрос удален.'
  end

  def show
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  private

  def questions_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
