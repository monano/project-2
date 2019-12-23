class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :issue, null: false, foreign_key: true
      t.string :description
      t.integer :working
      t.integer :not_working

      t.timestamps
    end
  end
end
