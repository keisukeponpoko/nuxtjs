class CreateArticleStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :article_statuses do |t|
      t.integer :article_id
      t.integer :status
      t.timestamps
    end
  end
end
