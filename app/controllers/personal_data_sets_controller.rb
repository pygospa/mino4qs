class PersonalDataSetsController < ApplicationController
  def index
    if PersonalDataSet.count == 0
      return
    #end
    else
    #if PersonalDataSet.count == 1
      redirect_to personal_data_set_path(PersonalDataSet.first.id)
    end
  end

  def show
    @personal_data_set = PersonalDataSet.find(params[:id])
  end

  def new
    @personal_data_set = PersonalDataSet.new
  end

  def create
    @personal_data_set = PersonalDataSet.new(personal_data_set_params)
    if @personal_data_set.save
      puts @personal_data_set.inspect
      flash[:success] = "Personal data successfully recorded"
      redirect_to new_personal_data_set_path
    else
      render "new"
    end
  end

  private
    def personal_data_set_params
      personal_data_set_params = params.require(:personal_data_set).permit(:birthday, :gender, :height)
      personal_data_set_params[:birthday] = Date.strptime(personal_data_set_params[:birthday], '%Y-%m-%d')
      return personal_data_set_params
    end
end
