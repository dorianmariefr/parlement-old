class RelationsController < ApplicationController
  before_action :load_person

  def index
    @child_of = policy_scope(Relation).where(to: @person).children
    @children = policy_scope(Relation).where(from: @person).children
    @friends = policy_scope(Relation).where(from: @person).friend.or(
      policy_scope(Relation).where(to: @person).friend
    )
  end

  def edit
    @relation = Relation.new(from: @person)
    authorize @relation
  end

  private

  def load_person
    @person = policy_scope(Person).where(user: current_user).find(params[:person_id])
  end
end
