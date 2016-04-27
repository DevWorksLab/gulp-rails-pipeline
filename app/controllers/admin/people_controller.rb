class Admin::PeopleController < AdminController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def set_person
      @person = Person.find(params[:id])
    end

end
