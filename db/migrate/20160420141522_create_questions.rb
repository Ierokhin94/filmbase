class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :type
      t.integer :interview_id

      t.timestamps null: false
    end
  end
end
