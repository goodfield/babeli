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

FactoryGirl.define do
  factory :translation_value do
    value { FFaker::Lorem.word }
    translation { FactoryGirl.create(:translation) }
    project_language { FactoryGirl.create(:project_language) }
  end
end
