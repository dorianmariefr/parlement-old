class Person < ApplicationRecord
  belongs_to :user

  validates :given_name, presence: true

  def to_s
    given_name
  end
end
