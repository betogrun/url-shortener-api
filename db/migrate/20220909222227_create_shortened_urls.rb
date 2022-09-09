class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      t.string :key, null: false
      t.string :shortened_url, null: false
      t.string :original_url, null: false

      t.timestamps
    end
  end
end
