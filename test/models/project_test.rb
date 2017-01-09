# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  key         :string
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  should have_many(:versions).dependent(:destroy)
  should have_many(:languages)
  should have_many(:project_languages).dependent(:destroy)

  test 'should be created by factory girl' do
    FactoryGirl.create(:project)
  end

end
