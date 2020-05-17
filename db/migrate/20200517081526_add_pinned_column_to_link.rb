class AddPinnedColumnToLink < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :pinned, :boolean, default: false
  end
end
