class RealtorsController < ApplicationController
  def index
    @realtors = Realtor.all
  end

  def new
    @realtor = Realtor.new
  end

  def create
    # binding.pry
    # @realtor = current_user.realtors.build(realtor_params)
    @realtor = Realtor.new(realtor_params)
    # @realtor.owner_id = current_user.id
    # binding.pry
    respond_to do |format|
      if @realtor.save
        format.html { redirect_to realtors_path, notice: 'realtor was successfully created.' }
        format.json { render :show, status: :created, location: @realtor }
      else
        format.html { render :new }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @realtor = Realtor.find(params[:id])
  end

  private

  def realtor_params
    params.require(:realtor).permit(:name, :email, :number, :rating)
  end
end
