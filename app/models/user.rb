class User < ApplicationRecord
  has_secure_password

  has_many :people, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
