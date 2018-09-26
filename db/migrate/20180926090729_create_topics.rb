class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :idea, default: ''
      t.string :category, default: ''
      t.string :sub_category, default: ''
      t.string :article_type, default: ''
      t.string :rank, default: ''
      t.string :title, default: ''
      t.text :description, default: ''
      t.text :comment, default: ''
      t.timestamps
    end
  end
end
