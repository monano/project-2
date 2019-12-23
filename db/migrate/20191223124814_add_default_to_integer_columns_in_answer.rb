class AddDefaultToIntegerColumnsInAnswer < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :working, :integer
    remove_column :answers, :not_working, :integer
    add_column :answers, :working, :integer, :default => 0
    add_column :answers, :not_working, :integer, :default => 0
  end
end
