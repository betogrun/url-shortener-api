class CreateUrlEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :url_entries do |t|
      t.string :key, null: false
      t.string :shortened_url, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
