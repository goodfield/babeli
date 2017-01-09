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

FactoryGirl.define do
  factory :project do
    key { SecureRandom.uuid }
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.words(10) }
  end
end
