class Admin::PeopleController < AdminController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    binding.pry
    @person = Person.new(person_params)
    if @person.save
      flash[:notice] = "#{@person.full_name} has been succesfully created"
      redirect_to admin_people_path
    else
      render :new
    end
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

    def person_params
      params.require(:person).permit(:first_name, :last_name, :bio, :email,
      :linkedin, :twitter, :title, :snippet, :header_pic, :profile_pic,
      :skill_one, :skill_one_icon, :skill_one_blurb, :skill_two, :skill_two_icon,
      :skill_two_blurb, :skill_three, :skill_three_icon, :skill_three_blurb,
      :priority)
    end

end
