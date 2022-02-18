class PeopleController < ApplicationController
  before_action :load_person, only: [:show, :edit, :update, :destroy]

  def index
    authorize Person.new(user: current_user)
    @people = policy_scope(Person).order(given_name: :asc, family_name: :asc)
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
      redirect_to @person, notice: "Person created"
    else
      flash.now.alert = @person.alert
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to @person, notice: "Person created"
    else
      flash.now.alert = @person.alert
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy!

    redirect_to people_path, notice: "Person deleted"
  end

  private

  def load_person
    @person = authorize(
      policy_scope(Person).where(user: current_user).find(params[:id])
    )
  end

  def person_params
    params.require(:person).permit(:given_name, :family_name)
  end
end
