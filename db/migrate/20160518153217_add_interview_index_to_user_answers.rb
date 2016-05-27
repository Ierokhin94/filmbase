class AddInterviewIndexToUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :interview_id, :integer
    remove_column :user_answers, :body, :text
    remove_column :user_answers, :time, :time
  end
end
