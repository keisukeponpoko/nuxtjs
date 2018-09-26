class CreateWorkerDesireTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :worker_desire_topics do |t|
      t.integer :topic_id
      t.integer :worker_id
      t.timestamps
    end
  end
end
