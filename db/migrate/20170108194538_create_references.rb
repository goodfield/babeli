class CreateReferences < ActiveRecord::Migration[5.0]
  def change

    add_reference :project_languages, :project, index: true
    add_foreign_key :project_languages, :project

    add_reference :project_languages, :language, index: true
    add_foreign_key :project_languages, :language

    add_reference :versions, :project, index: true
    add_foreign_key :versions, :project

    add_reference :categories, :version, index: true
    add_foreign_key :categories, :version

    add_reference :translations, :category, index: true
    add_foreign_key :translations, :category

    add_reference :translation_values, :translation, index: true
    add_foreign_key :translation_values, :translation

    add_reference :translation_values, :project_language, index: true
    add_foreign_key :translation_values, :project_language

  end
end
