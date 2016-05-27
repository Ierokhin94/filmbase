class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.time :time
      t.text :body
      t.integer :user_id
      t.integer :answer_id

      t.timestamps null: false
    end
  end
end
