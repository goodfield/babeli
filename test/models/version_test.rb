# == Schema Information
#
# Table name: versions
#
#  id         :integer          not null, primary key
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#
# Indexes
#
#  index_versions_on_project_id  (project_id)
#

require 'test_helper'

class VersionTest < ActiveSupport::TestCase

  should belong_to(:project)
  should have_many(:categories).dependent(:destroy)

  test 'should be created by factory girl' do
    FactoryGirl.create(:version)
  end

end
