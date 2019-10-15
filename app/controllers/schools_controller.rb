class SchoolsController < ApplicationController
  before_action :set_school_id_param, only: [:update, :show, :destroy]

  def index
    render_response_success(School.all)
  end

  def show
    render_response_success(SchoolSerializer.new(School.find(@school_id)))
  end

  def create
    result = School.create!(school_params)
    render_response_success(SchoolSerializer.new(result))
  end

  def update
    result = School.update(@school_id, school_params)
    result.save!
    render_response_success(SchoolSerializer.new(result))
  end

  def destroy
    School.destroy(@school_id)
  end
  
  private

  def school_params
    params.require(:school)
    params.permit(:name, :address)
  end

  def set_school_id_param
    @school_id = params[:id]
  end
end
