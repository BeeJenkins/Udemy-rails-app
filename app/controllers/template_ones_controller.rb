class TemplateOnesController < ApplicationController
  before_action :set_template_one, only: [:show, :edit, :update, :destroy, :edit_about]
  before_action :authenticate_user!, except: [:show]
  before_action :not_admin_user, only: [ :edit, :update, :destroy]

  # GET /template_ones
  # GET /template_ones.json
  def index
    @template_ones = TemplateOne.all
    if current_user and !current_user.try(:admin?)
      redirect_to posts_path
    end
  end

  # GET /template_ones/1
  # GET /template_ones/1.json
  def show
    if current_user and !current_user.try(:admin?)
      redirect_to posts_path
    end
  end

  # GET /template_ones/new
  def new
    @template_one = TemplateOne.new
  end

  # GET /template_ones/1/edit
  def edit

  end

  # POST /template_ones
  # POST /template_ones.json
  def create
    @template_one = TemplateOne.new(template_one_params)

    respond_to do |format|
      if @template_one.save
        format.html { redirect_to @template_one, notice: 'Template one was successfully created.' }
        format.json { render :show, status: :created, location: @template_one }
      else
        format.html { render :new }
        format.json { render json: @template_one.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /template_ones/1
  # PATCH/PUT /template_ones/1.json
  def update
    respond_to do |format|
      if @template_one.update(template_one_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Template one was successfully updated.' }
        format.json { render :show, status: :ok, location: @template_one }
      else
        format.html { render :edit }
        format.json { render json: @template_one.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_ones/1
  # DELETE /template_ones/1.json
  def destroy
    @template_one.destroy
    respond_to do |format|
      format.html { redirect_to template_ones_url, notice: 'Template one was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_about

  end

  private
    # Use callbacks to share common setup or constraints between actions.
   def not_admin_user
      if !current_user.try(:admin) == true
        flash[:danger] = "The resource does not exist"
       redirect_to root_path
     end
   end

    def set_template_one
      @template_one = TemplateOne.find(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_one_params
      params.require(:template_one).permit(
          :about_show,
          :about_title,
          :about_text,
          :about_image,
      )
    end
end
