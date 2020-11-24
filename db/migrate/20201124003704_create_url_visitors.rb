class CreateUrlVisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :url_visitors do |t|
      t.string :ip
      t.references :tiny_url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
