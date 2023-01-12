class AddPostingAuthorityToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :posting_authority, :boolean, default: false
  end
end
