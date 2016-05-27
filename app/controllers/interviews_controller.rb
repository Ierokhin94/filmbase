class InterviewsController < ApplicationController
  before_action :check_authentication, except: [:index]
  before_action :check_edit, except: [:index, :show]
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  def index
    @interviews = Interview.includes(:user_answers)
  end

  def show
  end

  def new
    @interview = Interview.new
    question = @interview.questions.build
  end

  def edit
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      redirect_to @interview, notice: 'Опрос создан.'
    else
      render :new
    end
  end

  def update
    if @interview.update(interview_params)
      redirect_to @interview, notice: 'Опрос изменен.'
    else
      render :edit
    end
  end

  def destroy
    if @interview.destroy
      redirect_to interviews_url, notice: 'Опрос удален.'
    else
      render_error("Удаление опроса невозможно", url: @interview)
    end
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])

  end

  def interview_params
    params.require(:interview).permit(:title, questions_attributes: [:id, :body, :interview_id, :_destroy, answers_attributes:[:id, :body, :question_id, :_destroy]])
  end

  def check_edit
    render_error unless Interview.edit_by?(@current_user)
  end

end
