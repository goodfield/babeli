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

FactoryGirl.define do
  factory :version do
    value { "#{rand(0..9)}.#{rand(0..99)}.#{rand(0..9999)}" }
    project { FactoryGirl.create(:project) }
  end
end
