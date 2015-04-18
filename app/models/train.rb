class Train < ActiveRecord::Base
  validates :run, uniqueness: true
end
