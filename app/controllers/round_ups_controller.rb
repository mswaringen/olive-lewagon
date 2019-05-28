class RoundUpsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.create(portfolio: current_user.portfolios.last, amount: transaction_params[:amount])
    redirect_to new_payment_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount)
  end
end
