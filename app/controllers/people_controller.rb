class PeopleController < ApplicationController

  def index
  end

  def index
    people_array = Person.active
    @people = people_array.each_slice(3).to_a
  end

  def show
    @person = Person.find(params[:id])
  end

  def mona

  end

end
