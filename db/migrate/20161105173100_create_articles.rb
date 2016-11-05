class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, index: true
      t.string :url
      t.string :from
      t.timestamps null: false
    end
  end
end
