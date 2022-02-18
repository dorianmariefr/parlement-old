class PeopleController < ApplicationController
  before_action :load_person, only: [:show, :edit, :update, :destroy]

  def index
    authorize Person.new(user: current_user)
    @people = policy_scope(Person)
  end

  def show
  end

  def new
    @person = Person.new(user: current_user)
    authorize @person
  end

  def create
    @person = Person.new(person_params)
    @person.user = current_user
    authorize @person

    if @person.save
    else
    end
  end
end
