class Package < ActiveRecord::Base
  validates :name, presence: true
  validates :version, presence: true

  has_many :authors
  has_many :maintainers
end
