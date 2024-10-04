class CreateSpikes < ActiveRecord::Migration[7.0]
  def change
    create_table :spikes do |t|
      t.string :name
      t.string :image
      t.date :start_date
      t.date :end_date
      t.text :memory

      t.timestamps
    end
  end
end
