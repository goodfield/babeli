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

require 'test_helper'

class ProjectLanguageTest < ActiveSupport::TestCase

  should belong_to(:project)
  should belong_to(:language)
  should have_many(:translation_values).dependent(:destroy)

  test 'should be created by factory girl' do
    FactoryGirl.create(:project_language)
  end

end
