class CreateArticleDrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :article_drafts do |t|
      t.integer :article_id
      t.integer :worker_id
      t.integer :version
      t.integer :status_id
      t.text :body
      t.timestamps
    end
  end
end
