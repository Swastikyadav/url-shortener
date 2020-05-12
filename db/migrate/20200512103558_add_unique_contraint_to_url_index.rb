class AddUniqueContraintToUrlIndex < ActiveRecord::Migration[6.0]
  def change
    remove_index :links, :url
    add_index :links, :url, unique: true
  end
end
