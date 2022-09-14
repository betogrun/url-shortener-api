class DropUrlsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :shortened_urls
    drop_table :url_entries
  end
end
