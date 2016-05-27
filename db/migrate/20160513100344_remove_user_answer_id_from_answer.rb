class RemoveUserAnswerIdFromAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :user_answer_id, :integer
  end
end
