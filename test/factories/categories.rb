# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  key         :string
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  version_id  :integer
#
# Indexes
#
#  index_categories_on_version_id  (version_id)
#

FactoryGirl.define do
  factory :category do
    key { SecureRandom.uuid }
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.words(10) }
    version { FactoryGirl.create(:version) }
  end
end
