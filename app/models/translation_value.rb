# == Schema Information
#
# Table name: translation_values
#
#  id                  :integer          not null, primary key
#  value               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  translation_id      :integer
#  project_language_id :integer
#
# Indexes
#
#  index_translation_values_on_project_language_id  (project_language_id)
#  index_translation_values_on_translation_id       (translation_id)
#

class TranslationValue < ApplicationRecord

  belongs_to :translation
  belongs_to :project_language

end
