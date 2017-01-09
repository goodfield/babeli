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

class Translation < ApplicationRecord

  belongs_to :category
  has_many :translation_values, dependent: :destroy, autosave: true

end
