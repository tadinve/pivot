class CreatePivots < ActiveRecord::Migration
  def change
    create_table :pivots do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end

    add_index :pivots, [:user_id, :created_at]

  end
end
