# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LanguageTest < ActiveSupport::TestCase

  should have_many(:project_languages).dependent(:restrict_with_error)

  test 'should be created by factory girl' do
    FactoryGirl.create(:language)
  end

end
