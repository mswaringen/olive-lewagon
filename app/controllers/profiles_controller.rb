class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def dashboard
    @user = current_user
    @transactions = []
    @user.portfolios.each do |port|
      port.transactions.each do |trans|
        @transactions << trans
      end
    end
  end
end


