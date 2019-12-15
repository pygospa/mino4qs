class PersonalDataSetsController < ApplicationController
  def index
    if PersonalDataSet.count > 0
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
      flash[:success] = 'Personal data successfully recorded'
      redirect_to new_personal_data_set_path
    else
      render "new"
    end
  end

  private

  def personal_data_set_params
    pds_params = params.require(:personal_data_set) \
                       .permit(:birthday, :gender, :height)
    pds_params[:birthday] = Date.strptime(pds_params[:birthday], '%Y-%m-%d')
    return pds_params
  end
end

