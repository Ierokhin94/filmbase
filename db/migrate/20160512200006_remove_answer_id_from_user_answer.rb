class RemoveAnswerIdFromUserAnswer < ActiveRecord::Migration
  def change
    remove_column :user_answers, :answer_id, :integer
  end
end
