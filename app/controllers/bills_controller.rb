class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :update, :destroy]

  # GET /bills
  def index
    @bills = Bill.all

    render json: @bills
  end

  # GET /bills/1
  def show
    render json: @bill
  end

  # POST /bills
  def create
    @bill = Bill.new(bill_params)
   # @bill.users_id = 1
    binding.pry
    if @bill.save
      render json: @bill, status: :created, location: @bill
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @bill.update(bill_params)
      render json: @bill
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bills/1
  def destroy
    @bill.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end


  # Only allow a trusted parameter "white list" through.
  def bill_params
    params.permit(:article, :brand, :model, :serie, :color, :money, :accesories, :status, :report, :user_id)
     #params.permit(:data => [])
      #params.fetch(:bill, {})
   # params.require(:bill).permit(:article, :brand, :model, :serie, :color, :money, :accesories, :status, :report,:users_id)
  end
end
