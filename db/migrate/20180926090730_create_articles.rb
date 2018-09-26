class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :topic_id
      t.integer :worker_id
      t.text :body
      t.timestamps
    end
  end
end
