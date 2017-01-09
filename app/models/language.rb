# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Language < ApplicationRecord

  has_many :project_languages, dependent: :restrict_with_error, autosave: true
  has_many :projects, through: :project_languages, autosave: true

end
