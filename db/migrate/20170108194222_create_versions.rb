class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|

      t.string :value
      t.timestamps
    end
  end
end
