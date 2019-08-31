class PersonalDataController < ApplicationController
  def index
    if PersonalData.count == 0
      return
    end
  end

  def new
  end

  def create
    flash[:success] = "Personal data successfully recorded"
    redirect_to new_personal_datum_path
  end
end
