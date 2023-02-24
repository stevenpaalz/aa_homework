class AddIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :toys, [:name, :toyable_id, :toyable_type], unique: true

  end
end
