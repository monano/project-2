class Issue < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
 
  # validations
  validates :title, presence: true
  validates :description, presence: true
  validates :issue_type, presence: true

end
