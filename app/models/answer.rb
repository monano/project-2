class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :issue

    # validations
    validates :description, presence: true
    
end
