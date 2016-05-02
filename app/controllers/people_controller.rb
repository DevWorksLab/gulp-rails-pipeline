class PeopleController < ApplicationController

  def index
    @people = Person.active
  end

  def show
    @person = Person.find(params[:id])
  end

  def mona

  end

end
