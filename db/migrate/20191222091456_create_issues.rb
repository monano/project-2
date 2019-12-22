class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :type
      t.string :img , array: true, default: []
      t.string :os
      t.string :device_make
      t.string :pl
      t.string :pl_version
      t.string :text_editor
      t.integer :no_users

      t.timestamps
    end
  end
end
