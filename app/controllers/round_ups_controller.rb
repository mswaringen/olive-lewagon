class RoundUpsController < ApplicationController
  before_action :create_client, except: [:new, :create]

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.create(portfolio: current_user.portfolios.last, amount: transaction_params[:amount], status: :pending)
    redirect_to new_payment_path
  end

  def link
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
    exchange_token_response = @client.item.public_token.exchange(params['public_token'])
    current_user.update(access_token: exchange_token_response['access_token'])
    redirect_to link_result_path
  end

  def link_result
    @access_token = current_user.access_token
    @transaction_response = @client.transactions.get(@access_token, '2016-07-12', '2017-01-09')


    # the transactions in the response are paginated, so make multiple calls while
    # increasing the offset to retrieve all transactions
    # while @transactions.length < transaction_response['total_transactions']
    #   transaction_response = client.transactions.get(access_token,
    #                                                  '2016-07-12',
    #                                                  '2017-01-09',
    #                                                  offset: @transactions.length)
    #   @transactions += transaction_response.transactions
    # end
  end

  private

  def create_client
    @client = Plaid::Client.new(env: ENV['PLAID_ENV'],
                                client_id: ENV['PLAID_CLIENT_ID'],
                                secret: ENV['PLAID_SECRET'],
                                public_key: ENV['PLAID_PUBLIC_KEY'])
  end

  def transaction_params
    params.require(:transaction).permit(:amount)
  end
end
