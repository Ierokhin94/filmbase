class UserAnswer < ActiveRecord::Base
  has_and_belongs_to_many :answers
  belongs_to :user
  belongs_to :interview

  validate :all_questions_answered?
  validate :second_passage?
  validate :answers_right?
  attr_reader :user_answer_tokens

  def all_questions_answered?
    temp = Array.new
    answers.each do |a|
      temp << a.question if temp.exclude? a.question
    end
    errors.add(:answers, "даны не на все вопросы") if interview.questions.count != temp.size
    true
  end


  def second_passage?
    arr = Array.new
    interview.user_answers.each do |u|
      arr << u.user
    end
    errors.add(:user_answer, "повторно запрещено") if arr.include? user
    true
  end

  def answers_right?
    errors.add(:answers, "не соответствуют этому опросу") unless (answers - interview.answers).empty?
    true
  end

  def self.edit_by?(u)
    u.try(:admin?)
  end

end
