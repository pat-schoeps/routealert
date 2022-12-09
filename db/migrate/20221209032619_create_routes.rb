class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string  :start_loc
      t.string  :end_loc
      t.integer :sa_h
      t.integer :sa_m
      t.integer :travel_time
      t.integer :days, array: true, default: []
      t.string  :schedule_id
      t.string  :time_zone

      t.timestamps
    end
  end
end
