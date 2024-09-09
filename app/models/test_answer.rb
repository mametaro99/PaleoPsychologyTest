class TestAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :test_answer_details, dependent: :destroy
end
