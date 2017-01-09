class CreateProjectLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :project_languages do |t|
      t.timestamps
    end
  end
end
