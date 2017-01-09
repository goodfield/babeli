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

class Version < ApplicationRecord

  belongs_to :project
  has_many :categories, dependent: :destroy, autosave: true

end
