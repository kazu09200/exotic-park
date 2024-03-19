class User::PetsController < ApplicationController
  def new
    @pet = Pet.new
  end
  
  def index
    @user = current_user
    @pet = Pet.new
    @pets = Pet.all
  end
  
  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    if @pet.save
      redirect_to pet_path(@pet)
    else
      @user = current_user
      @pets = Pet.all
      render :index
    end
  end

  def show
  end

  def edit
  end
  
  private
    def pet_params
      params.require(:pet).permit(:name, :gender, :kinds, :introduction, :image)
    end
end
