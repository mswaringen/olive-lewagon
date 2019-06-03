class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def dashboard
    # @user = current_user
    # @transactions = @user.portfolios.flat_map(&:transactions)
    # same as above, slightly faster
    # @transactions = @user.portfolios.map(&:transactions).flatten

    @transactions = Transaction.where(portfolios: { user_id: current_user.id }).joins(:portfolio)

    @amounts = []
    @transaction_chart_data = @transactions.group_by_month(:transaction_date).sum(:amount_cents)

    # @user.portfolios.each do |port|
    #   port.transactions.each do |trans|
    #     @transactions << trans
    #     @amounts << trans.amount_cents
    #   end
    # end
  end
end
