class AddNullConstraintToUrlAndSlug < ActiveRecord::Migration[6.0]
  def change
    change_column_null :links, :url, false
    change_column_null :links, :slug, false
  end
end
