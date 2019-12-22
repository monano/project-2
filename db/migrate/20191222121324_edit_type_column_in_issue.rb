class EditTypeColumnInIssue < ActiveRecord::Migration[6.0]
  def change
    remove_column :issues, :type, :string
    add_column :issues, :issue_type, :string
  end
end
