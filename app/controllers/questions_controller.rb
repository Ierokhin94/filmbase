class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Опрос создан.'
    else
      render :new
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.permit(:body, :type, answers_attributes: [:id, :body, :question_id, :_destroy])
    end

end
