class Employee < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :dob, presence: true, uniqueness: true
  validates :mobile_number, presence: true, uniqueness: true
  validates :qualification, presence: true
  validates :project, presence: true
end
