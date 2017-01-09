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

class Project < ApplicationRecord

  has_many :versions, dependent: :destroy

  has_many :project_languages, dependent: :destroy, autosave: true
  has_many :languages, through: :project_languages, autosave: true

  def to_param
    key
  end

end
