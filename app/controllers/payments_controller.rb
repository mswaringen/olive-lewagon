class PaymentsController < ApplicationController
  before_action :find_transaction

  def new
  end

  def show
    @transaction = current_user.portfolios.last.transactions.last
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @transaction.amount_cents,
      description:  "Donation to <%= @transaction.portfolio.ngo.name %>",
      currency:     @transaction.amount.currency
    )

    @transaction.update(stripe_response: charge.to_json, status: :paid)
    redirect_to payment_path(@transaction)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_payment_path
  end

  private

  def find_transaction
    @transaction = current_user.portfolios.last.transactions.last
  end
end

