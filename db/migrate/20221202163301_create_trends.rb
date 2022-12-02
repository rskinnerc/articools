class CreateTrends < ActiveRecord::Migration[7.0]
  def change
    create_table :trends do |t|
      t.string :user_id, null: false
      t.string :query, null: false
      t.integer :query_count, null: false, default: 1

      t.timestamps
    end
  end
end
