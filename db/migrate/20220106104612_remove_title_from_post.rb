class RemoveTitleFromPost < ActiveRecord::Migration[6.1]
  def change
    remove_column(:posts, :title)
  end
end
