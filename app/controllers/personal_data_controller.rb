class PersonalDataController < ApplicationController
  def index
  end

  def new
  end

  def create
    flash[:success] = "Personal data successfully recorded"
    redirect_to new_personal_datum_path
  end
end
