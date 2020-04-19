class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.string :status, default: 'draft'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
