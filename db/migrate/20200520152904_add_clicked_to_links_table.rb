class AddClickedToLinksTable < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :clicked, :integer, default: 0
    change_column_null :links, :clicked, false
  end
end
