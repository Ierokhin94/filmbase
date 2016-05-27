class CreateJoinTableAnswerUserAnswer < ActiveRecord::Migration
  def change
    create_join_table :answers, :user_answers do |t|
      # t.index [:answer_id, :user_answer_id]
      # t.index [:user_answer_id, :answer_id]
    end
  end
end
