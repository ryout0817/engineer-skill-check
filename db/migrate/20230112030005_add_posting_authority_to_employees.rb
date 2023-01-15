class AddPostingAuthorityToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :news_posting_auth, :boolean, default: false
  end
end
