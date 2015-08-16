class CasesController < ApplicationController
  before_action :signed_in_user
  before_action :set_case, only: [:show, :edit, :update, :destroy]

  # GET /cases
  def index
    @cases = Case.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /cases/1
  def show
  end

  # GET /cases/new
  def new
    @case = Case.new
  end

  # GET /cases/1/edit
  def edit
  end

  # POST /cases
  def create
    @case = Case.new(case_params)

    if @case.save
      redirect_to @case, notice: 'Case was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /cases/1
  def update
    if @case.update(case_params)
      redirect_to @case, notice: 'Case was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /cases/1
  def destroy
    @case.destroy
    redirect_to cases_url, notice: 'Case was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def case_params
      params.require(:case).permit(:project_id, :case_name, :description, :tester_user_id)
    end
end
