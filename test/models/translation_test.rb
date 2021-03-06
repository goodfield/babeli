# == Schema Information
#
# Table name: translations
#
#  id          :integer          not null, primary key
#  key         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_translations_on_category_id  (category_id)
#

require 'test_helper'

class TranslationTest < ActiveSupport::TestCase

  should belong_to(:category)
  should have_many(:translation_values).dependent(:destroy)

  test 'should be created by factory girl' do
    FactoryGirl.create(:translation)
  end

end
