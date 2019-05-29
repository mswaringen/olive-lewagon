class RoundUpsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.create(portfolio: current_user.portfolios.last, amount: transaction_params[:amount], status: :pending)
    redirect_to new_payment_path
  end

  def link
    client = Plaid::Client.new(env: ENV['PLAID_ENV'],
                               client_id: ENV['PLAID_CLIENT_ID'],
                               secret: ENV['PLAID_SECRET'],
                               public_key: ENV['PLAID_PUBLIC_KEY'])
    # response = client.item.public_token.exchange(public_token)
    # access_token = response.access_token
    # transaction_response = client.transactions.get(access_token, '2016-07-12', '2017-01-09')
    # transactions = transaction_response.transactions

    # # the transactions in the response are paginated, so make multiple calls while
    # # increasing the offset to retrieve all transactions
    # while transactions.length < transaction_response['total_transactions']
    #   transaction_response = client.transactions.get(access_token,
    #                                                  '2016-07-12',
    #                                                  '2017-01-09',
    #                                                  offset: transactions.length)
    #   transactions += transaction_response.transactions
    # end
  end

  def get_access_token
    client = Plaid::Client.new(env: ENV['PLAID_ENV'],
                               client_id: ENV['PLAID_CLIENT_ID'],
                               secret: ENV['PLAID_SECRET'],
                               public_key: ENV['PLAID_PUBLIC_KEY'])
    exchange_token_response = client.item.public_token.exchange(params['public_token'])
    access_token = exchange_token_response['access_token']

    transaction_response = client.transactions.get(access_token, '2016-07-12', '2017-01-09')
    transactions = transaction_response.transactions

    # the transactions in the response are paginated, so make multiple calls while
    # increasing the offset to retrieve all transactions
    while transactions.length < transaction_response['total_transactions']
      transaction_response = client.transactions.get(access_token,
                                                     '2016-07-12',
                                                     '2017-01-09',
                                                     offset: transactions.length)
      transactions += transaction_response.transactions
    end
    raise
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount)
  end
end
