class Wage < ApplicationRecord
  belongs_to :preparer

  scope :created_in, ->(year) { where('extract(year from created_at) = ?', year ) }
end
