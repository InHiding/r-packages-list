class Package < ActiveRecord::Base
  validates :name, presence: true
  validates :version, presence: true

  has_many :authors, class_name: 'Developer'
  has_many :maintainers , class_name: 'Developer'
end
