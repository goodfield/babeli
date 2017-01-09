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

FactoryGirl.define do
  factory :translation do
    key { SecureRandom.uuid }
    category { FactoryGirl.create(:category) }
  end
end
