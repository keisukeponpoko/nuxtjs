class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :name
      t.boolean :is_editor, default: false
      t.boolean :is_checker, default: false
      t.boolean :is_admin, default: false
      t.timestamps
    end
  end
end
