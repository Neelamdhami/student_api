class EducationsController < ApiController
  before_action :set_education, only: %i[show update destroy]
  def index
    @educations = Education.all
    render json: @educations
  end

  def show    
    render json: @education
  end

  def update  
    @education.update(education_params)
    render json: @education
  end

  def destroy
    @education.destroy
    render json: "sucessfully destroy"
  end

  def create    
    @education = Education.new(education_params)
    @education.save
    render json: @education
  end

private
  def education_params
    params.require(:education).permit(:class_name,:board,:percentage,:passing_year,:branch,:user_id)
  end

  def set_education
    @education = Education.find(params[:id])
  end
end
