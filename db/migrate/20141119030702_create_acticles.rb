class CreateActicles < ActiveRecord::Migration
  def change
    create_table :acticles do |t|

      t.timestamps
    end
  end
end
