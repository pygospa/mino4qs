class PersonalDataController < ApplicationController
  def index
    if PersonalData.count == 0
      return
    end

    if PersonalData.count == 1
      redirect_to personal_datum_path(PersonalData.first.id)
    end
  end

  def show
    @personal_data = PersonalData.find(params[:id])
  end

  def new
  end

  def create
    flash[:success] = "Personal data successfully recorded"
    redirect_to new_personal_datum_path
  end
end
