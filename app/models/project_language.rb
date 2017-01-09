# == Schema Information
#
# Table name: project_languages
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer
#  language_id :integer
#
# Indexes
#
#  index_project_languages_on_language_id  (language_id)
#  index_project_languages_on_project_id   (project_id)
#

class ProjectLanguage < ApplicationRecord

  belongs_to :project, touch: true
  belongs_to :language, touch: true

  has_many :translation_values, dependent: :destroy

end
