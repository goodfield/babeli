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

FactoryGirl.define do
  factory :project_language do
    project { FactoryGirl.create(:project) }
    language { FactoryGirl.create(:language) }
  end
end
