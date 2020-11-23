class CreateTinyUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :tiny_urls do |t|
      t.string :mini_url
      t.text :original_url

      t.timestamps
    end
    add_index :tiny_urls, :mini_url, unique: true
  end
end
