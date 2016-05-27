class UserAnswersController < ApplicationController
  before_action :check_authentication, except: [:index]
  before_action :set_user_answer, only: [:show, :edit, :update, :destroy]

  def index
    @user_answers = UserAnswer.all
  end

  def show
  end

  def new
    @interview = Interview.find(params[:interview_id])
    arr = Array.new
    @interview.user_answers.each do |u|
      arr << u.user
    end
    if arr.include?(@current_user)
      redirect_to interviews_path, notice: 'Опрос проходили уже.'
    else
      @user_answer = UserAnswer.new
    end
  end

  def edit
  end


  def create
    @interview = Interview.find(params[:interview_id])
    @user_answer = UserAnswer.new(:user => @current_user, :interview => @interview)
    if params[:body]
      params[:body].values.each do |answer|
        @user_answer.answers << Answer.find(answer)
      end
      if @user_answer.save
        redirect_to @user_answer, notice: 'Опрос пройден.'
      else
        render :new, :interview_id => @interview
      end
    else
      flash[:notice] = "Ответьте на все вопросы!"
      redirect_to action: "new", :interview_id => params[:interview_id]
    end

    # @user_answer = UserAnswer.new(user_answer_array_params)
    # if @user_answer.save
    #   redirect_to @user_answer, notice: 'Опрос пройден.'
    # else
    #   render :new
    # end
  end

  private

  def set_user_answer
    @user_answer = UserAnswer.find(params[:id])
  end

  def check_edit
    render_error unless UserAnswer.edit_by?(@current_user)
  end

end
