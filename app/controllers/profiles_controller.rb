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
    hsh = @transactions.group_by_month(:transaction_date).sum(:amount_cents)
    hsh.each do |key, val|
      hsh[key] = val.to_f/100
    end
    @transaction_chart_data = hsh
    @transaction_total = @transactions.sum(:amount_cents)
    @impact = BigDecimal.new(current_user.portfolios.find_by(status:'active').ngo.impact)
    # @user.portfolios.each do |port|
    #   port.transactions.each do |trans|
    #     @transactions << trans
    #     @amounts << trans.amount_cents
    #   end
    # end
  end
end
