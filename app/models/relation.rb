class Relation < ApplicationRecord
  module Kind
    CHILDREN = "children"
    FRIEND = "friend"
    ALL = [CHILDREN, FRIEND]
  end

  belongs_to :from, class_name: "Person"
  belongs_to :to, class_name: "Person"

  scope :children, -> { where(kind: Kind::CHILDREN) }
  scope :friend, -> { where(kind: Kind::FRIEND) }

  validates :kind, presence: true, inclusion: { in: Kind::ALL }

  def children?
    kind == Kind::CHILDREN
  end

  def friend?
    kind == Kind::FRIEND
  end

  def kind_to_s
    t("kinds.#{kind}")
  end

  def to_s
    kind_to_s
  end
end
