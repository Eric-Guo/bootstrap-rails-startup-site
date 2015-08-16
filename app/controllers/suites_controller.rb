class SuitesController < ApplicationController
  before_action :signed_in_user
  before_action :set_suite, only: [:show, :edit, :update, :destroy]

  # GET /suites
  def index
    @suites = Suite.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /suites/1
  def show
  end

  # GET /suites/new
  def new
    @suite = Suite.new
  end

  # GET /suites/1/edit
  def edit
  end

  # POST /suites
  def create
    @suite = Suite.new(suite_params)

    if @suite.save
      redirect_to @suite.project, alert: 'Suite was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /suites/1
  def update
    if @suite.update(suite_params)
      redirect_to @suite, notice: 'Suite was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /suites/1
  def destroy
    @suite.destroy
    redirect_to suites_url, notice: 'Suite was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suite
      @suite = Suite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def suite_params
      params.require(:suite).permit(:project_id, :suite_name, :description, :case_id)
    end
end
