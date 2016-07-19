class AddGitHubRepoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :github_repo, :string
  end
end
